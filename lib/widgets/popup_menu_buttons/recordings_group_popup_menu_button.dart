import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/recordings_group_menu_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecordingsGroupPopupMenuButton extends StatelessWidget {
  final Function(RecordingsGroupMenuItem) onSelected;

  const RecordingsGroupPopupMenuButton({required this.onSelected, super.key});

  String _getLocalizedLabel(BuildContext context, RecordingsGroupMenuItem menuItem) {
    final l10n = AppLocalizations.of(context)!;
    switch (menuItem) {
      case RecordingsGroupMenuItem.exportAll:
        return l10n.exportGroup;
      case RecordingsGroupMenuItem.deleteAll:
        return l10n.deleteGroup;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => RecordingsGroupMenuItem.values
          .map<PopupMenuEntry<RecordingsGroupMenuItem>>(
              (RecordingsGroupMenuItem menuItem) => PopupMenuItem(
                  value: menuItem,
                  child: Row(
                    children: [
                      Icon(menuItem.icon),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(_getLocalizedLabel(context, menuItem)),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  )))
          .toList(),
    );
  }
}
