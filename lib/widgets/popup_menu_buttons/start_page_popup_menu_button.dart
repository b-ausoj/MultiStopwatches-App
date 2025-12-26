import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/start_page_card_menu_item.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class StartPagePopupMenuButton extends StatelessWidget {
  final Function(StartPageCardMenuItem) onSelected;

  const StartPagePopupMenuButton({required this.onSelected, super.key});

  String _getLocalizedLabel(
      BuildContext context, StartPageCardMenuItem menuItem) {
    final l10n = AppLocalizations.of(context)!;
    switch (menuItem) {
      case StartPageCardMenuItem.rename:
        return l10n.rename;
      case StartPageCardMenuItem.delete:
        return l10n.delete;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => StartPageCardMenuItem.values
          .map((menuItem) => PopupMenuItem<StartPageCardMenuItem>(
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
