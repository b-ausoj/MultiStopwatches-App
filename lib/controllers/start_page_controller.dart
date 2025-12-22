import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/badge_controller.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/utils/badge_checking.dart';

class StartController extends BadgeController {
  final String sharedPreferencesKey;
  final List<GroupModel> allGroups = [];
  late final SettingsModel settings = SettingsModel();

  // needs the label/visible for the menu(drawr) icon an the groups list items
  List<bool> isGroupBadgeVisibleList = [];
  late final AppLifecycleListener appLifecycleListener;

  late Timer timer;

  void Function() refreshScreen;

  StartController(this.refreshScreen, this.sharedPreferencesKey) {
    loadSettings(settings);
    appLifecycleListener = AppLifecycleListener(
      onPause: () => _saveState(),
      onInactive: () => _saveState(),
      onDetach: () => _saveState(),
    );
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      storeData(allGroups, sharedPreferencesKey);
    });
  }

  void _saveState() {
    log("Saving state due to lifecycle change");
    storeData(allGroups, sharedPreferencesKey);
  }

  @override
  void refreshBadgeState() {
    isGroupBadgeVisibleList = List.filled(allGroups.length, false);
    // could do all of that in parallel instead of .then
    isMenuBadgeRequired(allGroups, null).then((value) => badgeVisible = value);
    getUnseenRecordingsCount().then((value) => badgeLabel = value);

    for (int i = 0; i < allGroups.length; i++) {
      isGroupBadgeVisibleList[i] = isTextBadgeRequired(allGroups, allGroups[i]);
    }
    refreshScreen(); // calls set state because start badge doesn't have a ticker with setState
  }

  void removeGroup(GroupModel group) {
    allGroups.remove(group);
    refreshScreen();
    refreshBadgeState();
  }
}
