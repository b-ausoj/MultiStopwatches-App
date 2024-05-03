import 'dart:io';

import 'package:csv/csv.dart';
import 'package:multistopwatches/enums/time_format.dart';
import 'package:multistopwatches/models/recording_model.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/utils/times_formatting_utils.dart';
import 'package:multistopwatches/widgets/cards/recording_card.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> exportRecordingToCSV(
    RecordingModel recording, SettingsModel settings) async {
  final path = (await getApplicationDocumentsDirectory()).path;
  // Zielname: Export_20210801_1200_Group1.csv
  String dateTime = dateTimeForExport(recording.startingTime);
  String fileName =
      "$path/Export_${dateTime}_${recording.name.replaceAll(" ", "")}.csv";
  final file = File(fileName);

  List<List<String>> data = [];
  data.add(["", recording.fromGroup, dateTimeToString(recording.startingTime)]);
  data.add(["", "", ""]);
  data.addAll(recordingToList(recording, settings.timeFormat));

  file.writeAsString(
      ListToCsvConverter(fieldDelimiter: settings.csvDelimiter.delimiter)
          .convert(data));

  Share.shareXFiles([XFile(fileName)], text: "Here is your recording!");
}

Future<void> exportRecordingsSetToCSV(
    List<RecordingCard> recordings, SettingsModel settings) async {
  final path = (await getApplicationDocumentsDirectory()).path;
  String dateTime =
      dateTimeForExport(recordings.first.recordingModel.startingTime);
  String fileName =
      "$path/Export_${dateTime}_${recordings.first.recordingModel.fromGroup.replaceAll(" ", "")}.csv";
  final file = File(fileName);

  List<List<String>> data = [];
  data.add([
    "",
    recordings.first.recordingModel.fromGroup,
    dateTimeToString(recordings.first.recordingModel.startingTime)
  ]);
  for (RecordingCard recording in recordings) {
    data.add(["", "", ""]);
    data.addAll(recordingToList(recording.recordingModel, settings.timeFormat));
  }

  file.writeAsString(
      ListToCsvConverter(fieldDelimiter: settings.csvDelimiter.delimiter)
          .convert(data));

  Share.shareXFiles([XFile(fileName)], text: "Here is your recording!");
}

List<List<String>> recordingToList(
    RecordingModel recording, TimeFormat timeFormat) {
  List<List<String>> data = [];
  data.add([
    recording.name,
    "Total Time",
    durationToStringExport(recording.totalTime, timeFormat)
  ]);
  data.add(["Lap No.", "Lap Time", "Split Time"]);
  for (int i = 0; i < recording.lapTimes.length; i++) {
    data.add([
      (i + 1).toString(),
      durationToStringExport(recording.lapTimes[i].lapTime, timeFormat),
      durationToStringExport(recording.splitTimes[i].lapTime, timeFormat)
    ]);
  }
  return data;
}
