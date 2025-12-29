import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/badge_controller.dart';
import 'package:multistopwatches/enums/recordings_group_menu_item.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/utils/badge_checking.dart';
import 'package:multistopwatches/utils/export_to_csv.dart';
import 'package:multistopwatches/utils/snackbar_utils.dart';
import 'package:multistopwatches/widgets/popup_menu_buttons/recordings_group_popup_menu_button.dart';
import 'package:multistopwatches/widgets/cards/recording_card.dart';
import 'package:multistopwatches/widgets/text_with_badge/recordings_group_text_with_badge.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class RecordingsPageController extends BadgeController {
  BuildContext context;
  void Function() refresh;
  final List<RecordingCard> recordingCards = [];
  final List<Widget> recordingsList = [];
  final List<GroupModel> allGroups;
  final SettingsModel settings;

  RecordingsPageController(
      this.context, this.refresh, this.allGroups, this.settings);

  void createRecordingList() {
    recordingsList.clear();
    if (recordingCards.isEmpty) return;

    DateTime last = recordingCards.first.recordingModel.startingTime;
    List<RecordingCard> list = [];

    for (RecordingCard card in recordingCards) {
      if (last == card.recordingModel.startingTime) {
        list.add(card);
      } else {
        var timeStamp = last.copyWith();
        recordingsList.add(Card(
          clipBehavior: Clip.antiAlias,
          color: const Color(0xFFEFEFEF),
          elevation: 0,
          child: ExpansionTile(
            onExpansionChanged: (value) {
              if (!value) return; // only change if opens and not on close
              setViewedToTrue(timeStamp);
            },
            shape: const Border(),
            controlAffinity: ListTileControlAffinity.leading,
            trailing: RecordingsGroupPopupMenuButton(
                onSelected: (RecordingsGroupMenuItem item) {
              switch (item) {
                case RecordingsGroupMenuItem.deleteAll:
                  deleteRecordingsSet(timeStamp);
                  break;
                case RecordingsGroupMenuItem.exportAll:
                  exportRecordingsSetToCSV(
                      recordingCards
                          .where((element) =>
                              element.recordingModel.startingTime == timeStamp)
                          .toList(),
                      settings);
                  break;
              }
              //selectedMenu = item;
              refresh();
            }),
            title: Center(child: RecordingsGroupTextWithBadge(list, timeStamp)),
            subtitle: Center(
                child: Text(AppLocalizations.of(context)!.fromGroup(list.first.recordingModel.fromGroup))),
            children: list,
          ),
        ));
        list = [card];
      }
      last = card.recordingModel.startingTime;
    }
    if (list.isNotEmpty) {
      recordingsList.add(Card(
        elevation: 0,
        color: const Color(0xFFEFEFEF),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            if (!value) return; // only change if opens and not on close
            setViewedToTrue(last);
          },
          shape: const Border(),
          controlAffinity: ListTileControlAffinity.leading,
          trailing: RecordingsGroupPopupMenuButton(
              onSelected: (RecordingsGroupMenuItem item) {
            switch (item) {
              case RecordingsGroupMenuItem.deleteAll:
                deleteRecordingsSet(last);
                break;
              case RecordingsGroupMenuItem.exportAll:
                exportRecordingsSetToCSV(
                    recordingCards
                        .where((element) =>
                            element.recordingModel.startingTime == last)
                        .toList(),
                    settings);
                break;
            }
            //selectedMenu = item;
            refresh();
          }),
          title: Center(child: RecordingsGroupTextWithBadge(list, last)),
          subtitle: Center(
              child: Text(AppLocalizations.of(context)!.fromGroup(list.first.recordingModel.fromGroup))),
          children: list,
        ),
      ));
    }
  }

  void deleteAllRecordings() {
    List<RecordingCard> deletedCards = [];
    deletedCards.addAll(recordingCards);
    recordingCards.clear();
    createRecordingList();
    storeRecordingsState(this);
    refresh();
    showLongSnackBar(context, "All recordings have been deleted",
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              recordingCards.addAll(deletedCards);
              createRecordingList();
              storeRecordingsState(this);
              refresh();
            }));
  }

  Future<void> deleteRecoding(int id, String name) async {
    RecordingCard? deletedCard;
    recordingCards.removeWhere((element) {
      bool remove = element.recordingModel.id == id;
      if (remove) deletedCard = element;
      return remove;
    });
    createRecordingList();
    storeRecordingsState(this);
    refresh();
    if (deletedCard != null) {
      showLongSnackBar(context, "Recording have been deleted",
          action: SnackBarAction(
              label: "Undo",
              onPressed: () {
                recordingCards.add(deletedCard!);
                createRecordingList();
                storeRecordingsState(this);
                refresh();
              }));
    }
  }

  void deleteRecordingsSet(DateTime timestamp) {
    List<RecordingCard> deletedCards = [];
    recordingCards.removeWhere((element) {
      bool remove = element.recordingModel.startingTime == timestamp;
      if (remove) deletedCards.add(element);
      return remove;
    });
    createRecordingList();
    storeRecordingsState(this);
    refresh();
    showLongSnackBar(context, "Recordings have been deleted",
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              recordingCards.addAll(deletedCards);
              createRecordingList();
              storeRecordingsState(this);
              refresh();
            }));
  }

  @override
  void refreshBadgeState() {
    badgeVisible = isBackBadgeRequired(allGroups);
  }

  void setViewedToTrue(DateTime timestamp) {
    bool changed = false;
    for (RecordingCard card in recordingCards) {
      if (card.recordingModel.startingTime == timestamp &&
          !card.recordingModel.viewed) {
        card.recordingModel.viewed = true;
        changed = true;
      }
    }
    if (changed) {
      // only recreate list and store state if something changed
      createRecordingList();
      storeRecordingsState(this);
      refresh();
    }
  }
}
