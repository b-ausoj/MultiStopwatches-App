import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum RecordingCardMenuItem {
  rename(Icons.edit_outlined),
  export(Icons.save_alt),
  delete(Icons.delete_outline);

  final IconData icon;

  const RecordingCardMenuItem(this.icon);

  String label(BuildContext context) {
    switch (this) {
      case RecordingCardMenuItem.rename:
        return AppLocalizations.of(context)!.rename;
      case RecordingCardMenuItem.export:
        return AppLocalizations.of(context)!.exportItem;
      case RecordingCardMenuItem.delete:
        return AppLocalizations.of(context)!.delete;
    }
  }
}
