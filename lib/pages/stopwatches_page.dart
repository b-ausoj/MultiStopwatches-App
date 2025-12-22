import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:multistopwatches/controllers/stopwatches_page_controller.dart';
import 'package:multistopwatches/enums/sort_criterion.dart';
import 'package:multistopwatches/enums/sort_direction.dart';
import 'package:multistopwatches/enums/stopwatches_page_menu_item.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/widgets/cards/add_stopwatch_card.dart';
import 'package:multistopwatches/widgets/dialogs/delete_group_dialog.dart';
import 'package:multistopwatches/widgets/dialogs/rename_dialog.dart';
import 'package:multistopwatches/widgets/dialogs/sort_dialog.dart';
import 'package:multistopwatches/widgets/icons/navigation_icon.dart';
import 'package:multistopwatches/widgets/navigation_drawer.dart';
import 'package:multistopwatches/widgets/popup_menu_buttons/stopwatches_page_popup_menu_button.dart';

class StopwatchesPage extends StatefulWidget {
  final GroupModel group;
  final List<GroupModel> allGroups;
  final SettingsModel settings;
  final String sharedPreferencesKey;
  const StopwatchesPage(
      this.group, this.allGroups, this.settings, this.sharedPreferencesKey,
      {super.key});

  @override
  State<StopwatchesPage> createState() => _StopwatchesPageState();
}

class _StopwatchesPageState extends State<StopwatchesPage>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  late final StopwatchesPageController _stopwatchesPageController;
  late final GroupModel _groupModel = widget.group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: InkWell(
            onTap: _showRenameDialog,
            child: Text(_stopwatchesPageController.name)),
        leading: NavIcon(_stopwatchesPageController),
        actions: [
          StopwatchesPagePopupMenuButton(
            _stopwatchesPageController.name,
            onSelected: (StopwatchesPageMenuItem item) {
              switch (item) {
                case StopwatchesPageMenuItem.rename:
                  _showRenameDialog();
                  break;
                case StopwatchesPageMenuItem.deleteGroup:
                  _showDeleteGroupDialog();
                  break;
                case StopwatchesPageMenuItem.saveAll:
                  _stopwatchesPageController.saveAllStopwatches();
                  break;
                case StopwatchesPageMenuItem.resetAll:
                  _stopwatchesPageController.resetAllStopwatches();
                  break;
                case StopwatchesPageMenuItem.deleteAll:
                  _stopwatchesPageController.deleteAllStopwatches();
                  break;
                case StopwatchesPageMenuItem.changeOrder:
                  _showOrderDialog();
                  break;
              }
            },
          )
        ],
      ),
      drawer: NavDrawer(
          widget.allGroups,
          widget.settings,
          _stopwatchesPageController,
          _stopwatchesPageController.groupModel,
          widget.sharedPreferencesKey),
      floatingActionButton: _stopwatchesPageController.isFabActive()
          ? FloatingActionButton.extended(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF1E7927),
              onPressed: () {
                _stopwatchesPageController.startAllStopwatches();
                HapticFeedback.lightImpact();
              },
              label: const Text("START ALL"),
              icon: const Icon(Icons.play_arrow),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReorderableListView(
          buildDefaultDragHandles: _stopwatchesPageController.criterion ==
              SortCriterion.customReordable,
          footer: AddStopwatchCard(_stopwatchesPageController.addStopwatch),
          children: _stopwatchesPageController.stopwatchCards,
          onReorder: (int oldIndex, int newIndex) {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            _stopwatchesPageController.onReorder(oldIndex, newIndex);
          },
        ),
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
    _stopwatchesPageController = StopwatchesPageController(widget.allGroups,
        context, _groupModel, widget.settings, widget.sharedPreferencesKey);
    _ticker = createTicker((elapsed) {
      setState(() {});
      if (!widget.settings.seperateRunningStopped) {
        _stopwatchesPageController.changedState();
      }
    });
    _ticker.start();
    _stopwatchesPageController.refreshBadgeState();
  }

  Future<void> _showDeleteGroupDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DeleteGroupDialog(
          _stopwatchesPageController.name,
          onAccept: () {
            widget.allGroups.remove(_groupModel);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Future<void> _showOrderDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SortDialog(
            _stopwatchesPageController.criterion,
            _stopwatchesPageController.direction,
            (SortCriterion criterion, SortDirection direction) =>
                _stopwatchesPageController.setSorting(criterion, direction));
      },
    );
  }

  Future<String?> _showRenameDialog() async {
    String oldName = _stopwatchesPageController.name;
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return RenameDialog(oldName, (String newName) {
          setState(() {
            _stopwatchesPageController.name = newName;
          });
        });
      },
    );
  }
}
