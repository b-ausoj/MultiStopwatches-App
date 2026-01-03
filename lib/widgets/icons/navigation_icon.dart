import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  final bool badgeVisible;
  final int badgeLabel;

  const NavIcon(this.badgeVisible, this.badgeLabel, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Badge(
        isLabelVisible: badgeVisible,
        label: badgeLabel > 0 ? Text(badgeLabel.toString()) : null,
        smallSize: 8.0,
        child: const Icon(Icons.menu),
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
