import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/stopwatch_card_menu_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StopwatchPopupMenuButton extends StatelessWidget {
  final Function(StopwatchCardMenuItem) onSelected;

  const StopwatchPopupMenuButton({required this.onSelected, super.key});

  String _getLocalizedLabel(BuildContext context, StopwatchCardMenuItem menuItem) {
    final l10n = AppLocalizations.of(context)!;
    switch (menuItem) {
      case StopwatchCardMenuItem.rename:
        return l10n.rename;
      case StopwatchCardMenuItem.save:
        return l10n.save;
      case StopwatchCardMenuItem.reset:
        return l10n.reset;
      case StopwatchCardMenuItem.delete:
        return l10n.delete;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => StopwatchCardMenuItem.values
          .map((menuItem) => PopupMenuItem<StopwatchCardMenuItem>(
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
