import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/sort_criterion.dart';
import 'package:multistopwatches/enums/sort_direction.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/models/stopwatch_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/utils/snackbar_utils.dart';
import 'package:multistopwatches/utils/sorting_utils.dart';
import 'package:multistopwatches/widgets/cards/stopwatch_card.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class StopwatchesPageController {
  final List<GroupModel> allGroups;
  final List<StopwatchCard> _stopwatchCards = [];
  final List<String> _oldStopwatchesPage = [];
  final GroupModel groupModel;
  final SettingsModel settings;
  final String sharedPreferencesKey;

  StopwatchesPageController(this.allGroups, this.groupModel, this.settings,
      this.sharedPreferencesKey) {
    for (var element in groupModel.stopwatches) {
      _stopwatchCards.add(StopwatchCard(
        element,
        changedState,
        key: ValueKey<String>(element.id),
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

  Future<void> addStopwatch(BuildContext context) async {
    StopwatchModel model = StopwatchModel.create(
        AppLocalizations.of(context)!.athleteNumber(_stopwatchCards.length + 1));
    _stopwatchCards.add(StopwatchCard(model, changedState,
        key: ValueKey<String>(model.id), stopwatchesPageController: this));
    groupModel.stopwatches.add(model);
    changedState();
  }

  void changedState({bool saveImmediately = true}) {
    sortAndListCards(
        _stopwatchCards, groupModel.criterion, groupModel.direction, settings);
    // Save state immediately when stopwatch state changes
    if (saveImmediately) {
      storeData(allGroups, sharedPreferencesKey);
    }
  }

  void deleteAllStopwatches(BuildContext context) {
    _oldStopwatchesPage.clear();

    for (StopwatchCard card in _stopwatchCards) {
      if (card.stopwatchModel.state == StopwatchState.running) {
        showShortSnackBar(
            context, AppLocalizations.of(context)!.cantDeleteWhileRunning);
        return;
      }
      _oldStopwatchesPage.add(jsonEncode(card.stopwatchModel));
    }
    groupModel.stopwatches.clear();
    _stopwatchCards.clear();
    showLongSnackBar(
        context, AppLocalizations.of(context)!.allStopwatchesRemoved,
        action: SnackBarAction(
            label: AppLocalizations.of(context)!.undo,
            onPressed: () {
              restoreAllStopwatches(_oldStopwatchesPage);
              changedState();
            }));
  }

  void deleteStopwatch(String id, String name, BuildContext context) {
    int index = _stopwatchCards.indexWhere((element) =>
        element.stopwatchModel.id == id &&
        element.stopwatchModel.state != StopwatchState.running);
    int index2 =
        groupModel.stopwatches.indexWhere((element) => element.id == id);
    if (index == -1) {
      showShortSnackBar(
          context, AppLocalizations.of(context)!.cantDeleteWhileRunning);
      return;
    }
    StopwatchCard deleted = _stopwatchCards.removeAt(index);
    StopwatchModel deletedModel = groupModel.stopwatches.removeAt(index2);
    showLongSnackBar(
        context, AppLocalizations.of(context)!.stopwatchRemoved(name),
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
        stopwatchCards.every(
            (element) => element.stopwatchModel.state == StopwatchState.reset);
  }

  void resetAllStopwatches(BuildContext context) {
    // save all in json string list
    // call everyone to reset itself
    // if undo then delete list and load json
    for (StopwatchCard card in _stopwatchCards) {
      if (card.stopwatchModel.state == StopwatchState.running) {
        showShortSnackBar(
            context, AppLocalizations.of(context)!.cantResetWhileRunning);
        return;
      }
    }
    for (StopwatchCard card in _stopwatchCards) {
      card.stopwatchModel.reset();
    }
    showLongSnackBar(context, AppLocalizations.of(context)!.allStopwatchesReset,
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
        key: ValueKey<String>(json["id"]),
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
