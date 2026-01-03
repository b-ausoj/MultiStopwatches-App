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
  void Function() refresh;
  final List<RecordingCard> recordingCards = [];
  final List<Widget> recordingsList = [];
  final List<GroupModel> allGroups;
  final SettingsModel settings;
  int corruptedRecordingsCount = 0;

  RecordingsPageController(this.refresh, this.allGroups, this.settings);

  void createRecordingList(BuildContext context) {
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
          elevation: 0,
          child: ExpansionTile(
            onExpansionChanged: (value) {
              if (!value) return; // only change if opens and not on close
              setViewedToTrue(timeStamp, context);
            },
            shape: const Border(),
            controlAffinity: ListTileControlAffinity.leading,
            trailing: RecordingsGroupPopupMenuButton(
                onSelected: (RecordingsGroupMenuItem item) {
              switch (item) {
                case RecordingsGroupMenuItem.deleteAll:
                  deleteRecordingsSet(timeStamp, context);
                  break;
                case RecordingsGroupMenuItem.exportAll:
                  exportRecordingsSetToCSV(
                      recordingCards
                          .where((element) =>
                              element.recordingModel.startingTime == timeStamp)
                          .toList(),
                      settings,
                      context);
                  break;
              }
              //selectedMenu = item;
              refresh();
            }),
            title: Center(child: RecordingsGroupTextWithBadge(list, timeStamp)),
            subtitle: Center(
                child: Text(AppLocalizations.of(context)!
                    .fromGroup(list.first.recordingModel.fromGroup))),
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
        child: ExpansionTile(
          onExpansionChanged: (value) {
            if (!value) return; // only change if opens and not on close
            setViewedToTrue(last, context);
          },
          shape: const Border(),
          controlAffinity: ListTileControlAffinity.leading,
          trailing: RecordingsGroupPopupMenuButton(
              onSelected: (RecordingsGroupMenuItem item) {
            switch (item) {
              case RecordingsGroupMenuItem.deleteAll:
                deleteRecordingsSet(last, context);
                break;
              case RecordingsGroupMenuItem.exportAll:
                exportRecordingsSetToCSV(
                    recordingCards
                        .where((element) =>
                            element.recordingModel.startingTime == last)
                        .toList(),
                    settings,
                    context);
                break;
            }
            //selectedMenu = item;
            refresh();
          }),
          title: Center(child: RecordingsGroupTextWithBadge(list, last)),
          subtitle: Center(
              child: Text(AppLocalizations.of(context)!
                  .fromGroup(list.first.recordingModel.fromGroup))),
          children: list,
        ),
      ));
    }
  }

  void deleteAllRecordings(BuildContext context) {
    List<RecordingCard> deletedCards = [];
    deletedCards.addAll(recordingCards);
    recordingCards.clear();
    createRecordingList(context);
    storeRecordingsState(this);
    refresh();
    showLongSnackBar(
        context, AppLocalizations.of(context)!.allRecordingsDeleted,
        action: SnackBarAction(
            label: AppLocalizations.of(context)!.undo,
            onPressed: () {
              recordingCards.addAll(deletedCards);
              createRecordingList(context);
              storeRecordingsState(this);
              refresh();
            }));
  }

  Future<void> deleteRecording(
      String id, String name, BuildContext context) async {
    RecordingCard? deletedCard;
    recordingCards.removeWhere((element) {
      bool remove = element.recordingModel.id == id;
      if (remove) deletedCard = element;
      return remove;
    });
    createRecordingList(context);
    storeRecordingsState(this);
    refresh();
    if (deletedCard != null) {
      showLongSnackBar(context, AppLocalizations.of(context)!.recordingDeleted,
          action: SnackBarAction(
              label: AppLocalizations.of(context)!.undo,
              onPressed: () {
                recordingCards.add(deletedCard!);
                createRecordingList(context);
                storeRecordingsState(this);
                refresh();
              }));
    }
  }

  void deleteRecordingsSet(DateTime timestamp, BuildContext context) {
    List<RecordingCard> deletedCards = [];
    recordingCards.removeWhere((element) {
      bool remove = element.recordingModel.startingTime == timestamp;
      if (remove) deletedCards.add(element);
      return remove;
    });
    createRecordingList(context);
    storeRecordingsState(this);
    refresh();
    showLongSnackBar(context, AppLocalizations.of(context)!.recordingsDeleted,
        action: SnackBarAction(
            label: AppLocalizations.of(context)!.undo,
            onPressed: () {
              recordingCards.addAll(deletedCards);
              createRecordingList(context);
              storeRecordingsState(this);
              refresh();
            }));
  }

  @override
  void refreshBadgeState() {
    badgeVisible = isBackBadgeRequired(allGroups);
  }

  void setViewedToTrue(DateTime timestamp, BuildContext context) {
    final matchingCards = recordingCards.where((card) =>
        card.recordingModel.startingTime == timestamp &&
        !card.recordingModel.viewed);

    if (matchingCards.isEmpty) return;

    for (final card in matchingCards) {
      card.recordingModel.viewed = true;
    }

    createRecordingList(context);
    storeRecordingsState(this);
    refresh();
  }
}
