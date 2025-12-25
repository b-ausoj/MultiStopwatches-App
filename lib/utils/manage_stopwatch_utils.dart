import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multistopwatches/models/stopwatch_model.dart';
import 'package:multistopwatches/utils/snackbar_utils.dart';
import 'package:multistopwatches/widgets/cards/stopwatch_card.dart';

void deleteStopwatch(int id, String name, List<StopwatchCard> stopwatchCards,
    BuildContext context) {
  int index = stopwatchCards.indexWhere((element) =>
      element.stopwatchModel.id == id &&
      element.stopwatchModel.state != StopwatchState.running);
  if (index == -1) {
    showShortSnackBar(context, "Can't delete while running");
    return;
  }
  StopwatchCard deleted = stopwatchCards.removeAt(index);
  storeHomeState(stopwatchCards);
  showLongSnackBar(context, "'$name' has been removed",
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            stopwatchCards.add(deleted);
            stopwatchCards.sort(
              (a, b) => a.stopwatchModel.id.compareTo(b.stopwatchModel.id),
            );
            storeHomeState(stopwatchCards);
          }));
}

void restoreAllStopwatches(List<String> oldHome,
    List<StopwatchCard> stopwatchCards, BuildContext context) {
  stopwatchCards.clear();
  for (String entry in oldHome) {
    dynamic json = jsonDecode(entry);
    stopwatchCards.add(StopwatchCard(
      json["name"],
      (int id, String name) =>
          deleteStopwatch(id, name, stopwatchCards, context),
      changedState,
      json["id"],
      key: Key("${json["id"]}"),
      json: json,
    ));
  }
}
