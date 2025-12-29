import 'package:flutter/material.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/utils/badge_checking.dart';

class GroupNavTextWithBadge extends StatelessWidget {
  final String name;
  final GroupModel group;
  final List<GroupModel> allGroups;

  const GroupNavTextWithBadge({
    super.key,
    required this.name,
    required this.group,
    required this.allGroups,
  });

  @override
  Widget build(BuildContext context) {
    final badgeVisible = isTextBadgeRequired(allGroups, group);

    return Badge(
      isLabelVisible: badgeVisible,
      alignment: Alignment.topRight,
      //offset: const Offset(8, 0),
      smallSize: 8.0,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
