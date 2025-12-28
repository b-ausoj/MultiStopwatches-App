import 'package:flutter/material.dart';
import 'package:multistopwatches/utils/times_formatting_utils.dart';
import 'package:multistopwatches/widgets/cards/recording_card.dart';

class RecordingsGroupTextWithBadge extends StatefulWidget {
  final List<RecordingCard> list;
  final DateTime timeStamp;

  const RecordingsGroupTextWithBadge(this.list, this.timeStamp, {super.key});

  @override
  State<RecordingsGroupTextWithBadge> createState() =>
      _RecordingsGroupTextWithBadgeState();
}

class _RecordingsGroupTextWithBadgeState
    extends State<RecordingsGroupTextWithBadge> {
  @override
  Widget build(BuildContext context) {
    return Badge(
      alignment: Alignment.topRight,
      offset: const Offset(24, 0),
      isLabelVisible: !widget.list.first.recordingModel.viewed,
      label: Text("${widget.list.length}"),
      child: Text(dateTimeToString(widget.timeStamp)),
    );
  }
}
