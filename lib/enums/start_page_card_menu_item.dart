import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum StartPageCardMenuItem {
  rename(Icons.edit_outlined),
  delete(Icons.delete_outlined);

  final IconData icon;

  const StartPageCardMenuItem(this.icon);

  String label(BuildContext context) {
    switch (this) {
      case StartPageCardMenuItem.rename:
        return AppLocalizations.of(context)!.rename;
      case StartPageCardMenuItem.delete:
        return AppLocalizations.of(context)!.delete;
    }
  }
}
