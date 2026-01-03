import 'package:flutter/material.dart';
import 'package:multistopwatches/utils/times_formatting_utils.dart';
import 'package:multistopwatches/widgets/cards/recording_card.dart';

class RecordingsGroupTextWithBadge extends StatelessWidget {
  final List<RecordingCard> list;
  final DateTime timeStamp;

  const RecordingsGroupTextWithBadge(this.list, this.timeStamp, {super.key});

  @override
  Widget build(BuildContext context) {
    return Badge(
      alignment: Alignment.topRight,
      offset: const Offset(24, 0),
      isLabelVisible: !list.first.recordingModel.viewed,
      label: Text(list.length.toString()),
      child: Text(dateTimeToString(timeStamp)),
    );
  }
}
