import 'dart:convert';

import 'package:multistopwatches/enums/csv_delimiter.dart';
import 'package:multistopwatches/enums/locale_setting.dart';
import 'package:multistopwatches/enums/sort_criterion.dart';
import 'package:multistopwatches/enums/sort_direction.dart';
import 'package:multistopwatches/enums/theme_mode_setting.dart';
import 'package:multistopwatches/enums/time_format.dart';

class SettingsModel {
  SortCriterion defaultSortCriterion = SortCriterion.customReordable;
  SortDirection defaultSortDirection = SortDirection.ascending;
  bool separateRunningStopped = true;
  CSVDelimiter csvDelimiter = CSVDelimiter.semicolon;
  TimeFormat timeFormat = TimeFormat.hhmmss;
  LocaleSetting locale = LocaleSetting.auto;
  ThemeModeSetting themeMode = ThemeModeSetting.system;

  SettingsModel();

  void copyFrom(String json) {
    SettingsModel other = SettingsModel.fromJson(jsonDecode(json));
    defaultSortCriterion = other.defaultSortCriterion;
    defaultSortDirection = other.defaultSortDirection;
    separateRunningStopped = other.separateRunningStopped;
    csvDelimiter = other.csvDelimiter;
    timeFormat = other.timeFormat;
    locale = other.locale;
    themeMode = other.themeMode;
  }

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    SettingsModel settingsModel = SettingsModel();
    settingsModel.defaultSortCriterion =
        SortCriterion.values[json["defaultSortCriterion"]];
    settingsModel.defaultSortDirection =
        SortDirection.values[json["defaultSortDirection"]];
    settingsModel.separateRunningStopped = json["separateRunningStopped"];
    settingsModel.csvDelimiter = CSVDelimiter.values[json["csvDelimiter"]];
    settingsModel.timeFormat = TimeFormat.values[json["timeFormat"]];
    // Handle migration from old languageCode string to new locale enum
    if (json.containsKey("locale")) {
      settingsModel.locale = LocaleSetting.values[json["locale"]];
    } else if (json.containsKey("languageCode")) {
      // Migrate old languageCode to new locale enum
      String? languageCode = json["languageCode"];
      if (languageCode == null) {
        settingsModel.locale = LocaleSetting.auto;
      } else if (languageCode == 'en') {
        settingsModel.locale = LocaleSetting.english;
      } else if (languageCode == 'de') {
        settingsModel.locale = LocaleSetting.german;
      } else {
        settingsModel.locale = LocaleSetting.auto;
      }
    }
    settingsModel.themeMode = ThemeModeSetting.values[json["themeMode"] ?? 0];
    return settingsModel;
  }

  Map<String, dynamic> toJson() => {
        "defaultSortCriterion": defaultSortCriterion.index,
        "defaultSortDirection": defaultSortDirection.index,
        "separateRunningStopped": separateRunningStopped,
        "csvDelimiter": csvDelimiter.index,
        "timeFormat": timeFormat.index,
        "locale": locale.index,
        "themeMode": themeMode.index,
      };
}
