import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/stopwatches_page_menu_item.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class StopwatchesPagePopupMenuButton extends StatelessWidget {
  final String name;
  final Function(StopwatchesPageMenuItem) onSelected;

  const StopwatchesPagePopupMenuButton(this.name,
      {required this.onSelected, super.key});

  String _getLocalizedLabel(
      BuildContext context, StopwatchesPageMenuItem menuItem) {
    final l10n = AppLocalizations.of(context)!;
    switch (menuItem) {
      case StopwatchesPageMenuItem.rename:
        return l10n.rename;
      case StopwatchesPageMenuItem.deleteGroup:
        return l10n.deleteThisGroup;
      case StopwatchesPageMenuItem.saveAll:
        return l10n.saveAll;
      case StopwatchesPageMenuItem.resetAll:
        return l10n.resetAll;
      case StopwatchesPageMenuItem.deleteAll:
        return l10n.deleteAll;
      case StopwatchesPageMenuItem.changeOrder:
        return l10n.changeOrder;
    }
  }

  // TODO: should improve this menu, not sure if it is intuitive and clear
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => StopwatchesPageMenuItem.values
          .map((menuItem) => PopupMenuItem<StopwatchesPageMenuItem>(
                value: menuItem,
                child: Row(
                  children: [
                    Icon(menuItem.icon),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(_getLocalizedLabel(context, menuItem)),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
