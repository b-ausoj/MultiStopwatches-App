import 'dart:convert';
import 'dart:js_interop';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:multistopwatches/enums/time_format.dart';
import 'package:multistopwatches/models/recording_model.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/utils/times_formatting_utils.dart';
import 'package:multistopwatches/widgets/cards/recording_card.dart';
import 'package:share_plus/share_plus.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:web/web.dart' as web;

Future<void> saveAndShareCsv(
    String csvContent, String fileName, BuildContext context) async {
  final bytes = utf8.encode(csvContent);

  // On web (desktop), auto-download the file
  if (kIsWeb) {
    final blob =
        web.Blob([bytes.toJS].toJS, web.BlobPropertyBag(type: 'text/csv'));
    final url = web.URL.createObjectURL(blob);
    (web.document.createElement('a') as web.HTMLAnchorElement
          ..href = url
          ..download = fileName)
        .click();
    web.URL.revokeObjectURL(url);
  } else {
    // On mobile, use the share dialog
    await SharePlus.instance.share(
      ShareParams(
        files: [
          XFile.fromData(
            bytes,
            name: fileName,
            mimeType: 'text/csv',
          ),
        ],
      ),
    );
  }
}

Future<void> exportRecordingToCSV(RecordingModel recording,
    SettingsModel settings, BuildContext context) async {
  String dateTime = dateTimeForExport(recording.startingTime);
  String fileName =
      "Export_${dateTime}_${recording.name.replaceAll(" ", "")}.csv";

  List<List<String>> data = [];
  data.add(["", recording.fromGroup, dateTimeToString(recording.startingTime)]);
  data.add(["", "", ""]);
  data.addAll(recordingToList(recording, settings.timeFormat, context));

  String csvContent =
      ListToCsvConverter(fieldDelimiter: settings.csvDelimiter.delimiter)
          .convert(data);

  await saveAndShareCsv(csvContent, fileName, context);
}

Future<void> exportRecordingsGroupToCSV(List<RecordingCard> recordings,
    SettingsModel settings, BuildContext context) async {
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
    data.addAll(recordingToList(
        recording.recordingModel, settings.timeFormat, context));
  }

  String csvContent =
      ListToCsvConverter(fieldDelimiter: settings.csvDelimiter.delimiter)
          .convert(data);

  await saveAndShareCsv(csvContent, fileName, context);
}

List<List<String>> recordingToList(
    RecordingModel recording, TimeFormat timeFormat, BuildContext context) {
  List<List<String>> data = [];
  data.add([
    recording.name,
    AppLocalizations.of(context)!.totalTime,
    durationToStringExport(recording.totalTime, timeFormat)
  ]);
  data.add([
    AppLocalizations.of(context)!.lapNo,
    AppLocalizations.of(context)!.lapTime,
    AppLocalizations.of(context)!.splitTime
  ]);
  for (int i = 0; i < recording.lapTimes.length; i++) {
    data.add([
      (i + 1).toString(),
      durationToStringExport(recording.lapTimes[i].lapTime, timeFormat),
      durationToStringExport(recording.splitTimes[i].lapTime, timeFormat)
    ]);
  }
  return data;
}
