// get all configurations and for every configuration get all stopwatches
// check for every stopwatch if it is running
// if one is running and its not the current configuration, show a badge at the menu burger
// if the navdrawer is open, show a badge at the corresponding configuration where the stopwatch is running

import 'dart:convert';

import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/models/stopwatch_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<GroupModel> getAllRunningConfigurations(List<GroupModel> allGroups) {
  List<GroupModel> runningGroups = [];

  for (GroupModel group in allGroups) {
    for (StopwatchModel stopwatch in group.stopwatches) {
      if (stopwatch.isRunning) {
        runningGroups.add(group);
        break;
      }
    }
  }

  return runningGroups;
}

Future<int> getUnseenRecordingsCount() async {
  int count = 0;

  final prefs = await SharedPreferences.getInstance();
  List<String> recordings = prefs.getStringList("recordings") ?? [];

  for (String entry in recordings) {
    dynamic json = jsonDecode(entry);
    if (!json["viewed"]) {
      count++;
    }
  }
  return count;
}

bool isBackBadgeRequired(List<GroupModel> allGroups) {
  return getAllRunningConfigurations(allGroups).isNotEmpty;
}

// menu badge only if there are any running stopwatches or new recordings entries
Future<bool> isMenuBadgeRequired(
    List<GroupModel> allGroups, GroupModel? group) async {
  // check if there are any running stopwatches
  List<GroupModel> runningGroups = getAllRunningConfigurations(allGroups);
  runningGroups.remove(group);
  if (runningGroups.isNotEmpty) {
    return true;
  }
  // check if there are any unseen recordings entries
  int unseenRecordingsCount = await getUnseenRecordingsCount();
  return unseenRecordingsCount > 0;
}

bool isTextBadgeRequired(List<GroupModel> allGroups, GroupModel group) {
  // check if there are any running stopwatches
  List<GroupModel> runningConfigurations =
      getAllRunningConfigurations(allGroups);
  return runningConfigurations.contains(group);
}
