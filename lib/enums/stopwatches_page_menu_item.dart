import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum StopwatchesPageMenuItem {
  renameGroup(Icons.edit_outlined),
  deleteGroup(Icons.delete_forever_outlined),
  saveAll(Icons.save_outlined),
  resetAll(Icons.refresh),
  deleteAll(Icons.delete_outline),
  changeOrder(Icons.sort);

  final IconData icon;

  const StopwatchesPageMenuItem(this.icon);

  String label(BuildContext context) {
    switch (this) {
      case StopwatchesPageMenuItem.renameGroup:
        return AppLocalizations.of(context)!.renameGroup;
      case StopwatchesPageMenuItem.deleteGroup:
        return AppLocalizations.of(context)!.deleteThisGroup;
      case StopwatchesPageMenuItem.saveAll:
        return AppLocalizations.of(context)!.saveAll;
      case StopwatchesPageMenuItem.resetAll:
        return AppLocalizations.of(context)!.resetAll;
      case StopwatchesPageMenuItem.deleteAll:
        return AppLocalizations.of(context)!.deleteAll;
      case StopwatchesPageMenuItem.changeOrder:
        return AppLocalizations.of(context)!.changeOrder;
    }
  }
}
