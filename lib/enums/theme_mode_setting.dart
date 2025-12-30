import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum ThemeModeSetting {
  system,
  light,
  dark;

  String label(BuildContext context) {
    switch (this) {
      case ThemeModeSetting.system:
        return AppLocalizations.of(context)!.themeModeSystem;
      case ThemeModeSetting.light:
        return AppLocalizations.of(context)!.themeModeLight;
      case ThemeModeSetting.dark:
        return AppLocalizations.of(context)!.themeModeDark;
    }
  }

  ThemeMode toThemeMode() {
    switch (this) {
      case ThemeModeSetting.system:
        return ThemeMode.system;
      case ThemeModeSetting.light:
        return ThemeMode.light;
      case ThemeModeSetting.dark:
        return ThemeMode.dark;
    }
  }
}
