import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum SortDirection {
  ascending,
  descending;

  String label(BuildContext context) {
    switch (this) {
      case SortDirection.ascending:
        return AppLocalizations.of(context)!.sortAscending;
      case SortDirection.descending:
        return AppLocalizations.of(context)!.sortDescending;
    }
  }
}
