import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/recordings_group_menu_item.dart';

class RecordingsGroupPopupMenuButton extends StatelessWidget {
  final Function(RecordingsGroupMenuItem) onSelected;

  const RecordingsGroupPopupMenuButton({required this.onSelected, super.key});

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
                      Text(menuItem.label(context)),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  )))
          .toList(),
    );
  }
}
