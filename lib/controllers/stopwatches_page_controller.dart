import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/badge_controller.dart';
import 'package:multistopwatches/enums/sort_criterion.dart';
import 'package:multistopwatches/enums/sort_direction.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/models/stopwatch_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/utils/badge_checking.dart';
import 'package:multistopwatches/utils/snackbar_utils.dart';
import 'package:multistopwatches/utils/sorting.dart';
import 'package:multistopwatches/widgets/cards/stopwatch_card.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class StopwatchesPageController extends BadgeController {
  BuildContext context;
  final List<GroupModel> allGroups;
  final List<StopwatchCard> _stopwatchCards = [];
  final List<String> _oldStopwatchesPage = [];
  final GroupModel groupModel;
  final SettingsModel settings;
  final String sharedPreferencesKey;

  StopwatchesPageController(this.allGroups, this.context, this.groupModel,
      this.settings, this.sharedPreferencesKey) {
    for (var element in groupModel.stopwatches) {
      _stopwatchCards.add(StopwatchCard(
        element,
        changedState,
        key: Key("${element.id}"),
        stopwatchesPageController: this,
      ));
    }
    changedState();
  }

  SortDirection get direction => groupModel.direction;
  String get name => groupModel.name;
  set name(String value) => groupModel.name = value;
  SortCriterion get criterion => groupModel.criterion;
  List<StopwatchCard> get stopwatchCards => _stopwatchCards;

  Future<void> addStopwatch() async {
    // TODO: not taking the card count but the highest number a stopwatch has in "Athlete X" or cardsCount (whatever is bigger)
    int id = StopwatchModel.nextId++;

    StopwatchModel model =
        StopwatchModel(AppLocalizations.of(context)!.athleteNumber(_stopwatchCards.length + 1), id);
    _stopwatchCards.add(StopwatchCard(model, changedState,
        key: Key("$id"), stopwatchesPageController: this));
    groupModel.stopwatches.add(model);
    changedState();
  }

  void changedState() {
    sortAndListCards(
        _stopwatchCards, groupModel.criterion, groupModel.direction, settings);
    refreshBadgeState();
    // Save state immediately when stopwatch state changes
    storeData(allGroups, sharedPreferencesKey);
  }

  void deleteAllStopwatches() {
    _oldStopwatchesPage.clear();

    for (StopwatchCard card in _stopwatchCards) {
      if (card.stopwatchModel.state == StopwatchState.running) {
        showShortSnackBar(context, AppLocalizations.of(context)!.cantDeleteWhileRunning);
        return;
      }
      _oldStopwatchesPage.add(jsonEncode(card.stopwatchModel));
    }
    groupModel.stopwatches.clear();
    _stopwatchCards.clear();
    showLongSnackBar(context, AppLocalizations.of(context)!.allStopwatchesRemoved,
        action: SnackBarAction(
            label: AppLocalizations.of(context)!.undo,
            onPressed: () {
              restoreAllStopwatches(_oldStopwatchesPage);
              changedState();
            }));
  }

  void deleteStopwatch(int id, String name) {
    int index = _stopwatchCards.indexWhere((element) =>
        element.stopwatchModel.id == id &&
        element.stopwatchModel.state != StopwatchState.running);
    int index2 =
        groupModel.stopwatches.indexWhere((element) => element.id == id);
    if (index == -1) {
      showShortSnackBar(context, AppLocalizations.of(context)!.cantDeleteWhileRunning);
      return;
    }
    StopwatchCard deleted = _stopwatchCards.removeAt(index);
    StopwatchModel deletedModel = groupModel.stopwatches.removeAt(index2);
    showLongSnackBar(context, AppLocalizations.of(context)!.stopwatchRemoved(name),
        action: SnackBarAction(
            label: AppLocalizations.of(context)!.undo,
            onPressed: () {
              _stopwatchCards.add(deleted);
              groupModel.stopwatches.insert(index2, deletedModel);
              changedState();
            }));
  }

  bool isFabActive() {
    return stopwatchCards.isNotEmpty &&
        stopwatchCards.every((element) =>
            element.stopwatchModel.state == StopwatchState.reseted);
  }

  @override
  void refreshBadgeState() {
    isMenuBadgeRequired(allGroups, groupModel)
        .then((value) => badgeVisible = value);
    getUnseenRecordingsCount().then((value) => badgeLabel = value);
  }

  void resetAllStopwatches() {
    // save all in json string list
    // call everyone to reset itself
    // if undo then delete list and load json
    for (StopwatchCard card in _stopwatchCards) {
      if (card.stopwatchModel.state == StopwatchState.running) {
        showShortSnackBar(context, AppLocalizations.of(context)!.cantResetWhileRunning);
        return;
      }
    }
    for (StopwatchCard card in _stopwatchCards) {
      card.stopwatchModel.reset();
    }
    showLongSnackBar(context, AppLocalizations.of(context)!.allStopwatchesReseted,
        action: SnackBarAction(
            label: AppLocalizations.of(context)!.undo,
            onPressed: () {
              for (var element in _stopwatchCards) {
                element.stopwatchModel.restore();
              }
            }));
  }

  void saveAllStopwatches() {
    for (StopwatchCard element in stopwatchCards) {
      if (element.stopwatchModel.state == StopwatchState.stopped) {
        saveStopwatch(element.stopwatchModel, name);
      }
    }
    changedState();
  }

  void restoreAllStopwatches(List<String> oldStopwatchesPage) {
    _stopwatchCards.clear();
    for (String entry in oldStopwatchesPage) {
      dynamic json = jsonDecode(entry);
      StopwatchModel stopwatch = StopwatchModel.fromJson(json);
      _stopwatchCards.add(StopwatchCard(
        stopwatch,
        changedState,
        key: Key("${json["id"]}"),
        stopwatchesPageController: this,
      ));
      groupModel.stopwatches.add(stopwatch);
    }
  }

  void setSorting(SortCriterion criterion, SortDirection direction) {
    groupModel.criterion = criterion;
    groupModel.direction = direction;
    changedState();
  }

  void startAllStopwatches() {
    for (var element in _stopwatchCards) {
      element.stopwatchModel.start();
    }
  }

  void onReorder(int oldIndex, int newIndex) {
    StopwatchCard stopwatchCard = stopwatchCards.removeAt(oldIndex);
    stopwatchCards.insert(newIndex, stopwatchCard);

    StopwatchModel stopwatchModel = groupModel.stopwatches.removeAt(oldIndex);
    groupModel.stopwatches.insert(newIndex, stopwatchModel);
  }
}
