import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/stopwatches_page_menu_item.dart';

class StopwatchesPagePopupMenuButton extends StatelessWidget {
  final String name;
  final Function(StopwatchesPageMenuItem) onSelected;

  const StopwatchesPagePopupMenuButton(this.name,
      {required this.onSelected, super.key});

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
                    Text(menuItem.label(context)),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
