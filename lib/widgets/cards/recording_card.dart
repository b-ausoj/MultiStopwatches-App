import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/recording_card_menu_item.dart';
import 'package:multistopwatches/models/recording_model.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/utils/export_to_csv.dart';
import 'package:multistopwatches/utils/times_formatting_utils.dart';
import 'package:multistopwatches/widgets/popup_menu_buttons/recording_popup_menu_button.dart';
import 'package:multistopwatches/widgets/dialogs/rename_dialog.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class RecordingCard extends StatefulWidget {
  final RecordingModel recordingModel;
  final void Function(String id, String name) deleteRecording;
  final SettingsModel settings;

  const RecordingCard(this.recordingModel, this.deleteRecording, this.settings,
      {super.key});

  @override
  State<RecordingCard> createState() => _RecordingCardState();
}

class _RecordingCardState extends State<RecordingCard> {
  late final RecordingModel _recordingModel = widget.recordingModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 0, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: _showRenameDialog,
                    child: Text(_recordingModel.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0,
                            height: 1)),
                  ),
                ),
                Text(durationToString(_recordingModel.totalTime),
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w600, height: 1)),
                const Spacer(
                  flex: 1,
                ),
                RecordingPopupMenuButton(
                  onSelected: (RecordingCardMenuItem item) {
                    switch (item) {
                      case RecordingCardMenuItem.rename:
                        _showRenameDialog();
                        break;
                      case RecordingCardMenuItem.export:
                        exportRecordingToCSV(
                            _recordingModel, widget.settings, context);
                        break;
                      case RecordingCardMenuItem.delete:
                        widget.deleteRecording(
                            _recordingModel.id, _recordingModel.name);
                        break;
                    }
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(formatLapCount(_recordingModel.lapTimes),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400, height: 1)),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    Text(AppLocalizations.of(context)!.lapTime,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1)),
                    Text(formatLapTimes(_recordingModel.lapTimes),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1)),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    Text(AppLocalizations.of(context)!.splitTime,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1)),
                    Text(formatLapTimes(_recordingModel.splitTimes),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String?> _showRenameDialog() async {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return RenameDialog(
          initialName: _recordingModel.name,
          title: AppLocalizations.of(context)!.renameRecording,
          existingNames: const [],
          onAccept: (String text) {
            setState(() {
              _recordingModel.name = text;
            });
            storeRecordingState(_recordingModel);
          },
        );
      },
    );
  }
}
