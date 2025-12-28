import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:multistopwatches/enums/time_format.dart';
import 'package:multistopwatches/models/recording_model.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/utils/times_formatting_utils.dart';
import 'package:multistopwatches/widgets/cards/recording_card.dart';
import 'package:share_plus/share_plus.dart';

Future<void> saveAndShareCsv(String csvContent, String fileName) async {
  final bytes = utf8.encode(csvContent);

  await SharePlus.instance.share(
    ShareParams(
      files: [
        XFile.fromData(
          bytes,
          name: fileName,
          mimeType: 'text/csv',
        ),
      ],
      text: "Here is your recording!",
    ),
  );
}

Future<void> exportRecordingToCSV(
    RecordingModel recording, SettingsModel settings) async {
  String dateTime = dateTimeForExport(recording.startingTime);
  String fileName =
      "Export_${dateTime}_${recording.name.replaceAll(" ", "")}.csv";

  List<List<String>> data = [];
  data.add(["", recording.fromGroup, dateTimeToString(recording.startingTime)]);
  data.add(["", "", ""]);
  data.addAll(recordingToList(recording, settings.timeFormat));

  String csvContent = ListToCsvConverter(fieldDelimiter: settings.csvDelimiter.delimiter)
      .convert(data);

  await saveAndShareCsv(csvContent, fileName);
}

Future<void> exportRecordingsSetToCSV(
    List<RecordingCard> recordings, SettingsModel settings) async {
  String dateTime =
      dateTimeForExport(recordings.first.recordingModel.startingTime);
  String fileName =
      "Export_${dateTime}_${recordings.first.recordingModel.fromGroup.replaceAll(" ", "")}.csv";

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

  String csvContent = ListToCsvConverter(fieldDelimiter: settings.csvDelimiter.delimiter)
      .convert(data);

  await saveAndShareCsv(csvContent, fileName);
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
