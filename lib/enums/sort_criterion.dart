import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum SortCriterion {
  name,
  longestTime,
  longestLapTime,
  customReordable;

  String label(BuildContext context) {
    switch (this) {
      case SortCriterion.name:
        return AppLocalizations.of(context)!.sortByName;
      case SortCriterion.longestTime:
        return AppLocalizations.of(context)!.sortByLongestTime;
      case SortCriterion.longestLapTime:
        return AppLocalizations.of(context)!.sortByLongestLapTime;
      case SortCriterion.customReordable:
        return AppLocalizations.of(context)!.sortByCustom;
    }
  }
}
