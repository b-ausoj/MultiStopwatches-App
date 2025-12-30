import 'package:multistopwatches/enums/time_format.dart';
import 'package:multistopwatches/models/lap_model.dart';

String dateTimeToString(DateTime dateTime) {
  String d = dateTime.day.toString().padLeft(2, '0');
  String m = dateTime.month.toString().padLeft(2, '0');
  String y = dateTime.year.toString();
  String h = dateTime.hour.toString().padLeft(2, '0');
  String min = dateTime.minute.toString().padLeft(2, '0');
  //String sec = dateTime.second.toString().padLeft(2, '0');
  return "$h:$min $d.$m.$y";
}

String dateTimeForExport(DateTime dateTime) {
  String d = dateTime.day.toString().padLeft(2, '0');
  String m = dateTime.month.toString().padLeft(2, '0');
  String y = dateTime.year.toString();
  String h = dateTime.hour.toString().padLeft(2, '0');
  String min = dateTime.minute.toString().padLeft(2, '0');
  //String sec = dateTime.second.toString().padLeft(2, '0');
  return "$y$m${d}_$h$min";
}

String durationToString(Duration duration) {
  int hours = duration.inHours;
  int minutes = duration.inMinutes % 60;
  int seconds = duration.inSeconds % 60;
  int dSeconds = duration.inMilliseconds ~/ 100 % 10;
  // int hSeconds = duration.inMilliseconds ~/ 10 % 100;
  return "${hours > 0 ? "$hours:" : ""}${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.$dSeconds";
}

String durationToStringExport(Duration duration, TimeFormat timeFormat) {
  if (timeFormat == TimeFormat.mmssds) return durationToString(duration);
  int hours = duration.inHours;
  int minutes = duration.inMinutes % 60;
  int seconds = duration.inSeconds % 60;
  return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
}

String formatLapCount(List<LapModel> lapTimes) {
  StringBuffer result = StringBuffer();
  for (LapModel lap in lapTimes) {
    result.write("\n${lap.id.toString().padLeft(2, '0')}");
  }
  return result.toString();
}

String formatLapTimes(List<LapModel> lapTimes) {
  StringBuffer result = StringBuffer();
  for (LapModel lap in lapTimes) {
    result.write(
        "${durationToString(lap.lapTime)}${lap.id == lapTimes.length ? "" : "\n"}");
  }
  return result.toString();
}

String formatPastLaps(List<LapModel> lapList, bool showAllLaps) {
  if (lapList.isEmpty) {
    return "";
  } else if (showAllLaps) {
    StringBuffer result = StringBuffer();
    for (LapModel lap in lapList.reversed) {
      result.write(
          "${lap.id.toString().padLeft(2, '0')} ${durationToString(lap.lapTime)}${lap.id == 1 ? "" : "\n"}");
    }
    return result.toString();
  } else {
    LapModel lap = lapList.last;
    return "${lap.id.toString().padLeft(2, '0')} ${durationToString(lap.lapTime)}";
  }
}
