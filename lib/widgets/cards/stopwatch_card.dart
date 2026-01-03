import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:multistopwatches/controllers/stopwatches_page_controller.dart';
import 'package:multistopwatches/enums/stopwatch_card_menu_item.dart';
import 'package:multistopwatches/models/stopwatch_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/utils/snackbar_utils.dart';
import 'package:multistopwatches/utils/times_formatting_utils.dart';
import 'package:multistopwatches/widgets/dialogs/rename_dialog.dart';
import 'package:multistopwatches/widgets/popup_menu_buttons/stopwatch_popup_menu_button.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/config/app_themes.dart';

class StopwatchCard extends StatefulWidget {
  final StopwatchesPageController stopwatchesPageController;
  final void Function() changedState;

  final StopwatchModel stopwatchModel;

  const StopwatchCard(this.stopwatchModel, this.changedState,
      {super.key, required this.stopwatchesPageController});

  @override
  State createState() => _StopwatchCardState();
}

class _StopwatchCardState extends State<StopwatchCard>
    with SingleTickerProviderStateMixin {
  late final StopwatchModel _stopwatchModel = widget.stopwatchModel;
  late final Ticker _ticker;
  bool showAllLaps = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            // times column
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
            child: InkWell(
              onTap: () {
                if (_stopwatchModel.lapList.length > 1) {
                  setState(() {
                    showAllLaps = !showAllLaps;
                  });
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // main elapsed time
                  Text(durationToString(_stopwatchModel.elapsedTime),
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          height: 1.0)),
                  // lap time
                  Text(
                      "${(_stopwatchModel.lapCount + 1).toString().padLeft(2, '0')} ${durationToString(_stopwatchModel.elapsedLapTime)}",
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          height: 1.0)),
                  // past lap times
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(formatPastLaps(_stopwatchModel.lapList, showAllLaps),
                          style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              height: 1.0)),
                      if (_stopwatchModel.lapList.length > 1)
                        Transform.translate(
                          offset: const Offset(0, -2),
                          child: SizedBox(
                            height: 12,
                            child: Icon(
                              showAllLaps
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              size: 16,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 4, // space between times and name/buttons
          ),
          Expanded(
            // name and buttons column
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  // name and menu button
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: _showRenameDialog,
                      child: Text(
                        _stopwatchModel.name,
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0,
                            height: 1),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                    StopwatchPopupMenuButton(
                      onSelected: (StopwatchCardMenuItem item) async {
                        switch (item) {
                          case StopwatchCardMenuItem.rename:
                            _showRenameDialog();
                            break;
                          case StopwatchCardMenuItem.save:
                            switch (_stopwatchModel.state) {
                              case StopwatchState.running:
                                showShortSnackBar(
                                    context,
                                    AppLocalizations.of(context)!
                                        .cantSaveWhileRunning);
                                break;
                              case StopwatchState.reset:
                                showShortSnackBar(
                                    context,
                                    AppLocalizations.of(context)!
                                        .cantSaveEmptyStopwatch);
                                break;
                              case StopwatchState.stopped:
                                saveStopwatch(_stopwatchModel,
                                    widget.stopwatchesPageController.name);
                                widget.changedState();
                                showLongSnackBar(
                                    context,
                                    AppLocalizations.of(context)!
                                        .hasBeenSavedAndReset(
                                            _stopwatchModel.name),
                                    action: SnackBarAction(
                                        label: AppLocalizations.of(context)!
                                            .undoReset,
                                        onPressed: () {
                                          _stopwatchModel.restore();
                                          widget.changedState();
                                        }));
                                break;
                            }
                            break;
                          case StopwatchCardMenuItem.reset:
                            switch (_stopwatchModel.state) {
                              case StopwatchState.running:
                                showShortSnackBar(
                                    context,
                                    AppLocalizations.of(context)!
                                        .cantResetWhileRunning);
                                break;
                              case StopwatchState.reset:
                                break;
                              case StopwatchState.stopped:
                                _stopwatchModel.reset();
                                widget.changedState();
                                showLongSnackBar(
                                    context,
                                    AppLocalizations.of(context)!
                                        .hasBeenReset(_stopwatchModel.name),
                                    action: SnackBarAction(
                                        label:
                                            AppLocalizations.of(context)!.undo,
                                        onPressed: () {
                                          _stopwatchModel.restore();
                                          widget.changedState();
                                        }));
                                break;
                            }
                            break;
                          case StopwatchCardMenuItem.delete:
                            widget.stopwatchesPageController.deleteStopwatch(
                                widget.stopwatchModel.id,
                                widget.stopwatchModel.name,
                                context);
                            break;
                        }
                      },
                    )
                  ],
                ),
                Padding(
                  // buttons row
                  padding: const EdgeInsets.fromLTRB(0, -4, 8, 8),
                  child: Row(
                    children: [
                      switch (_stopwatchModel.state) {
                        StopwatchState.reset => TextButton.icon(
                            onPressed: () {
                              _stopwatchModel.start();
                              widget.changedState();
                              HapticFeedback.lightImpact();
                            },
                            icon: const Icon(Icons.play_arrow),
                            label: Text(AppLocalizations.of(context)!.start),
                            style: TextButton.styleFrom(
                                foregroundColor: AppColors.buttonFg(isDark),
                                backgroundColor:
                                    AppColors.startButtonBg(isDark))),
                        StopwatchState.running => TextButton.icon(
                            onPressed: () {
                              _stopwatchModel.stop();
                              widget.changedState();
                              HapticFeedback.lightImpact();
                            },
                            icon: const Icon(Icons.stop),
                            label: Text(AppLocalizations.of(context)!.stop),
                            style: TextButton.styleFrom(
                                foregroundColor: AppColors.buttonFg(isDark),
                                backgroundColor:
                                    AppColors.stopButtonBg(isDark))),
                        StopwatchState.stopped => TextButton.icon(
                            onPressed: () {
                              _stopwatchModel.resume();
                              widget.changedState();
                              HapticFeedback.lightImpact();
                            },
                            icon: const Icon(Icons.play_arrow_outlined),
                            label: Text(AppLocalizations.of(context)!.resume),
                            style: TextButton.styleFrom(
                                foregroundColor: AppColors.buttonFg(isDark),
                                backgroundColor:
                                    AppColors.resumeButtonBg(isDark))),
                      },
                      const Spacer(),
                      TextButton.icon(
                        onPressed:
                            _stopwatchModel.state == StopwatchState.running
                                ? () {
                                    _stopwatchModel.lap();
                                    widget.changedState();
                                    HapticFeedback.lightImpact();
                                  }
                                : null,
                        icon: const Icon(Icons.flag),
                        label: Text(AppLocalizations.of(context)!.lap),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.buttonFg(isDark),
                          backgroundColor: AppColors.lapButtonBg(isDark),
                          disabledForegroundColor: AppColors.buttonFg(isDark),
                          disabledBackgroundColor:
                              AppColors.disabledButtonBg(isDark),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      if (_stopwatchModel.isRunning) {
        setState(() {});
      }
    });
    _ticker.start();
  }

  Future<String?> _showRenameDialog() async {
    // TODO: check if this makes sense
    // Get list of all stopwatch names in this group except current one
    final existingNames = widget
        .stopwatchesPageController.groupModel.stopwatches
        .where((sw) => sw.id != _stopwatchModel.id)
        .map((sw) => sw.name)
        .toList();

    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return RenameDialog(
          initialName: _stopwatchModel.name,
          title: AppLocalizations.of(context)!.renameStopwatch,
          existingNames: existingNames,
          onAccept: (String text) {
            _stopwatchModel.name = text;
            widget.changedState();
          },
        );
      },
    );
  }
}
