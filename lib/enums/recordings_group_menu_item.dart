import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum RecordingsGroupMenuItem {
  exportAll(Icons.save_alt_outlined),
  deleteAll(Icons.delete_outlined);

  final IconData icon;

  const RecordingsGroupMenuItem(this.icon);

  String label(BuildContext context) {
    switch (this) {
      case RecordingsGroupMenuItem.exportAll:
        return AppLocalizations.of(context)!.exportGroup;
      case RecordingsGroupMenuItem.deleteAll:
        return AppLocalizations.of(context)!.deleteGroup;
    }
  }
}
