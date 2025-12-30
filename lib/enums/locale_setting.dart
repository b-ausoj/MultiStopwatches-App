import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum LocaleSetting {
  auto,
  english,
  german;

  String label(BuildContext context) {
    switch (this) {
      case LocaleSetting.auto:
        return AppLocalizations.of(context)!.languageAuto;
      case LocaleSetting.english:
        return AppLocalizations.of(context)!.languageEnglish;
      case LocaleSetting.german:
        return AppLocalizations.of(context)!.languageGerman;
    }
  }

  Locale? toLocale() {
    switch (this) {
      case LocaleSetting.auto:
        return null;
      case LocaleSetting.english:
        return const Locale('en');
      case LocaleSetting.german:
        return const Locale('de');
    }
  }

  static LocaleSetting fromLocale(Locale? locale) {
    if (locale == null) return LocaleSetting.auto;
    switch (locale.languageCode) {
      case 'en':
        return LocaleSetting.english;
      case 'de':
        return LocaleSetting.german;
      default:
        return LocaleSetting.auto;
    }
  }
}
