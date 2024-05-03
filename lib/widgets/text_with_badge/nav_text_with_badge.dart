import 'package:flutter/material.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/utils/badge_checking.dart';

// TODO: This class is very ugly and its constructor, please revise it
class NavTextWithBadge extends StatefulWidget {
  final String name;
  final GroupModel? group;
  final List<GroupModel>? allGroups;
  final bool isRecordings;

  const NavTextWithBadge(
      this.name, this.group, this.allGroups, this.isRecordings,
      {super.key});

  @override
  State<NavTextWithBadge> createState() => _NavTextWithBadgeState();
}

class _NavTextWithBadgeState extends State<NavTextWithBadge> {
  bool badgeVisible = false;
  int badgeLabel = 0;

  @override
  void initState() {
    super.initState();
    if (!widget.isRecordings) {
      // TODO: Attention, this could throw an exception
      badgeVisible = isTextBadgeRequired(widget.allGroups!, widget.group!);
    }
    getUnseenRecordingsCount().then((value) => setState(
          () => badgeLabel = value,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      isLabelVisible: badgeVisible || badgeLabel > 0 && widget.isRecordings,
      label: badgeLabel > 0 && widget.isRecordings ? Text("$badgeLabel") : null,
      alignment: Alignment.centerRight,
      offset: const Offset(8, 0),
      smallSize: 8.0,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Text(
          widget.name,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
