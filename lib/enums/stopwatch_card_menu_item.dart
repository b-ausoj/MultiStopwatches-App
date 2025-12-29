import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum StopwatchCardMenuItem {
  rename(Icons.edit_outlined),
  save(Icons.save_outlined),
  reset(Icons.refresh),
  delete(Icons.delete_outline);

  final IconData icon;

  const StopwatchCardMenuItem(this.icon);

  String label(BuildContext context) {
    switch (this) {
      case StopwatchCardMenuItem.rename:
        return AppLocalizations.of(context)!.rename;
      case StopwatchCardMenuItem.save:
        return AppLocalizations.of(context)!.save;
      case StopwatchCardMenuItem.reset:
        return AppLocalizations.of(context)!.reset;
      case StopwatchCardMenuItem.delete:
        return AppLocalizations.of(context)!.delete;
    }
  }
}
