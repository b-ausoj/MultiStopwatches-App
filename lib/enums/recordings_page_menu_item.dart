import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum RecordingsPageMenuItem {
  exportAll(Icons.save_alt_outlined),
  deleteAll(Icons.delete_outlined);

  final IconData icon;

  const RecordingsPageMenuItem(this.icon);

  String label(BuildContext context) {
    switch (this) {
      case RecordingsPageMenuItem.exportAll:
        return AppLocalizations.of(context)!.exportAll;
      case RecordingsPageMenuItem.deleteAll:
        return AppLocalizations.of(context)!.deleteAll;
    }
  }
}
