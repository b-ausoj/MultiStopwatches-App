import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/recordings_page_menu_item.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class RecordingsPagePopupMenuButton extends StatelessWidget {
  final Function(RecordingsPageMenuItem) onSelected;

  const RecordingsPagePopupMenuButton({required this.onSelected, super.key});

  String _getLocalizedLabel(
      BuildContext context, RecordingsPageMenuItem menuItem) {
    final l10n = AppLocalizations.of(context)!;
    switch (menuItem) {
      case RecordingsPageMenuItem.exportAll:
        return l10n.exportAll;
      case RecordingsPageMenuItem.deleteAll:
        return l10n.deleteAll;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => RecordingsPageMenuItem.values
          .map<PopupMenuEntry<RecordingsPageMenuItem>>(
              (RecordingsPageMenuItem menuItem) => PopupMenuItem(
                  value: menuItem,
                  child: Row(
                    children: [
                      Icon(menuItem.icon),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(_getLocalizedLabel(context, menuItem)),
                    ],
                  )))
          .toList(),
    );
  }
}
