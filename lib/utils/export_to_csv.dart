import 'dart:convert';
import 'dart:js_interop';
import 'dart:typed_data';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:multistopwatches/enums/time_format.dart';
import 'package:multistopwatches/models/lap_model.dart';
import 'package:multistopwatches/models/recording_model.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/utils/snackbar_utils.dart';
import 'package:multistopwatches/utils/times_formatting_utils.dart';
import 'package:multistopwatches/widgets/cards/recording_card.dart';
import 'package:share_plus/share_plus.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:web/web.dart' as web;

Future<void> saveAndShareCsv(
    String csvContent, String fileName, BuildContext context) async {
  try {
    final bytes = utf8.encode(csvContent);

    if (kIsWeb) {
      await _downloadOnWeb(bytes, fileName, context);
    } else {
      await _shareOnMobile(bytes, fileName, context);
    }
  } on FormatException catch (_) {
    if (context.mounted) {
      showShortSnackBar(
          context, AppLocalizations.of(context)!.exportFailedEncoding);
    }
  }
}

Future<void> _downloadOnWeb(
    Uint8List bytes, String fileName, BuildContext context) async {
  // On web (desktop), auto-download the file
  try {
    final blob =
        web.Blob([bytes.toJS].toJS, web.BlobPropertyBag(type: 'text/csv'));
    final url = web.URL.createObjectURL(blob);
    (web.document.createElement('a') as web.HTMLAnchorElement
          ..href = url
          ..download = fileName)
        .click();
    web.URL.revokeObjectURL(url);
  } catch (e) {
    if (context.mounted) {
      showShortSnackBar(
          context, AppLocalizations.of(context)!.exportFailedBrowser);
    }
  }
}

Future<void> _shareOnMobile(
    Uint8List bytes, String fileName, BuildContext context) async {
  // On mobile, use the share dialog
  try {
    final result = await SharePlus.instance.share(
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

    if (result.status == ShareResultStatus.dismissed && context.mounted) {
      showShortSnackBar(context, AppLocalizations.of(context)!.exportCancelled);
    }
  } catch (e) {
    if (context.mounted) {
      showShortSnackBar(
          context, AppLocalizations.of(context)!.exportFailedShare);
    }
  }
}

Future<void> exportRecordingToCSV(RecordingModel recording,
    SettingsModel settings, BuildContext context) async {
  final String dateTime = dateTimeForExport(recording.startingTime);
  final String fileName =
      "Export_${dateTime}_${recording.name.replaceAll(" ", "")}.csv";

  final List<List<String>> data = <List<String>>[
    ["", recording.fromGroup, dateTimeToString(recording.startingTime)],
    ["", "", ""],
    ...recordingToList(recording, settings.timeFormat, context),
  ];

  final String csvContent = _convertToCsv(data, settings);
  await saveAndShareCsv(csvContent, fileName, context);
}

Future<void> exportRecordingsGroupToCSV(List<RecordingCard> recordings,
    SettingsModel settings, BuildContext context) async {
  if (recordings.isEmpty) return;

  final RecordingModel firstRecording = recordings.first.recordingModel;
  final String dateTime = dateTimeForExport(firstRecording.startingTime);
  final String fileName =
      "Export_${dateTime}_${firstRecording.fromGroup.replaceAll(" ", "")}.csv";

  final List<List<String>> data = <List<String>>[
    [
      "",
      firstRecording.fromGroup,
      dateTimeToString(firstRecording.startingTime)
    ],
  ];

  for (final recording in recordings) {
    data.add(["", "", ""]);
    data.addAll(recordingToList(
        recording.recordingModel, settings.timeFormat, context));
  }

  final csvContent = _convertToCsv(data, settings);
  await saveAndShareCsv(csvContent, fileName, context);
}

String _convertToCsv(List<List<String>> data, SettingsModel settings) {
  return ListToCsvConverter(fieldDelimiter: settings.csvDelimiter.delimiter)
      .convert(data);
}

List<List<String>> recordingToList(
    RecordingModel recording, TimeFormat timeFormat, BuildContext context) {
  final AppLocalizations localizations = AppLocalizations.of(context)!;

  final List<List<String>> data = <List<String>>[
    [
      recording.name,
      localizations.totalTime,
      durationToStringExport(recording.totalTime, timeFormat),
    ],
    [
      localizations.lapNo,
      localizations.lapTime,
      localizations.splitTime,
    ],
  ];

  for (var i = 0; i < recording.lapTimes.length; i++) {
    final LapModel lap = recording.lapTimes[i];
    final LapModel split = recording.splitTimes[i];

    data.add([
      lap.id.toString(),
      durationToStringExport(lap.lapTime, timeFormat),
      durationToStringExport(split.lapTime, timeFormat),
    ]);
  }

  return data;
}
