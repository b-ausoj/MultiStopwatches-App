import 'package:flutter/material.dart';
import 'package:multistopwatches/utils/badge_checking.dart';

class RecordingsNavTextWithBadge extends StatefulWidget {
  final String name;

  const RecordingsNavTextWithBadge({
    super.key,
    required this.name,
  });

  @override
  State<RecordingsNavTextWithBadge> createState() =>
      _RecordingsNavTextWithBadgeState();
}

class _RecordingsNavTextWithBadgeState
    extends State<RecordingsNavTextWithBadge> {
  int badgeLabel = 0;

  @override
  void initState() {
    super.initState();
    getUnseenRecordingsCount().then((value) => setState(() {
          badgeLabel = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
      isLabelVisible: badgeLabel > 0,
      label: badgeLabel > 0 ? Text(badgeLabel.toString()) : null,
      alignment: Alignment.topRight,
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
