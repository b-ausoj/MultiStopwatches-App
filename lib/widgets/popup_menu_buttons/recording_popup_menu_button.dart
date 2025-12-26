import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/recording_card_menu_item.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class RecordingPopupMenuButton extends StatelessWidget {
  final Function(RecordingCardMenuItem) onSelected;

  const RecordingPopupMenuButton({required this.onSelected, super.key});

  String _getLocalizedLabel(
      BuildContext context, RecordingCardMenuItem menuItem) {
    final l10n = AppLocalizations.of(context)!;
    switch (menuItem) {
      case RecordingCardMenuItem.rename:
        return l10n.rename;
      case RecordingCardMenuItem.export:
        return l10n.exportItem;
      case RecordingCardMenuItem.delete:
        return l10n.delete;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: onSelected,
        itemBuilder: (BuildContext context) => RecordingCardMenuItem.values
            .map<PopupMenuEntry<RecordingCardMenuItem>>(
                (RecordingCardMenuItem menuItem) => PopupMenuItem(
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
            .toList());
  }
}
