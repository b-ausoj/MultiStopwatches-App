import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:multistopwatches/controllers/stopwatches_page_controller.dart';
import 'package:multistopwatches/enums/sort_criterion.dart';
import 'package:multistopwatches/enums/sort_direction.dart';
import 'package:multistopwatches/enums/stopwatches_page_menu_item.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/utils/badge_checking.dart';
import 'package:multistopwatches/widgets/cards/add_stopwatch_card.dart';
import 'package:multistopwatches/widgets/dialogs/delete_group_dialog.dart';
import 'package:multistopwatches/widgets/dialogs/rename_dialog.dart';
import 'package:multistopwatches/widgets/dialogs/sort_dialog.dart';
import 'package:multistopwatches/widgets/icons/navigation_icon.dart';
import 'package:multistopwatches/widgets/navigation_drawer.dart';
import 'package:multistopwatches/widgets/popup_menu_buttons/stopwatches_page_popup_menu_button.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/config/app_themes.dart';

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
  bool _badgeVisible = false;
  int _badgeLabel = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: InkWell(
            onTap: _showRenameDialog,
            child: Text(_stopwatchesPageController.name)),
        leading: NavIcon(_badgeVisible, _badgeLabel),
        actions: [
          StopwatchesPagePopupMenuButton(
            _stopwatchesPageController.name,
            onSelected: (StopwatchesPageMenuItem item) {
              switch (item) {
                case StopwatchesPageMenuItem.renameGroup:
                  _showRenameDialog();
                  break;
                case StopwatchesPageMenuItem.deleteGroup:
                  _showDeleteGroupDialog();
                  break;
                case StopwatchesPageMenuItem.saveAll:
                  _stopwatchesPageController.saveAllStopwatches();
                  _loadBadgeState();
                  break;
                case StopwatchesPageMenuItem.resetAll:
                  _stopwatchesPageController.resetAllStopwatches(context);
                  break;
                case StopwatchesPageMenuItem.deleteAll:
                  _stopwatchesPageController.deleteAllStopwatches(context);
                  break;
                case StopwatchesPageMenuItem.changeOrder:
                  _showOrderDialog();
                  break;
              }
            },
          )
        ],
      ),
      drawer: NavDrawer(widget.allGroups, widget.settings,
          _stopwatchesPageController.groupModel, widget.sharedPreferencesKey),
      floatingActionButton: _stopwatchesPageController.isFabActive()
          ? FloatingActionButton.extended(
              foregroundColor: AppColors.buttonFg(isDark),
              backgroundColor: AppColors.startButtonBg(isDark),
              onPressed: () {
                _stopwatchesPageController.startAllStopwatches();
                HapticFeedback.lightImpact();
              },
              label: Text(AppLocalizations.of(context)!.startAll),
              icon: const Icon(Icons.play_arrow),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReorderableListView(
          buildDefaultDragHandles: _stopwatchesPageController.criterion ==
              SortCriterion.customReordable,
          footer: AddStopwatchCard(
              () => _stopwatchesPageController.addStopwatch(context)),
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
    _stopwatchesPageController = StopwatchesPageController(
        widget.allGroups, _groupModel, widget.settings, widget.sharedPreferencesKey,
        onStopwatchSaved: _loadBadgeState);
    _ticker = createTicker((elapsed) {
      setState(() {});
      if (!widget.settings.separateRunningStopped) {
        _stopwatchesPageController.changedState(saveImmediately: false);
      }
    });
    _ticker.start();
    _loadBadgeState();
  }

  Future<void> _loadBadgeState() async {
    final results = await Future.wait([
      isMenuBadgeRequired(widget.allGroups, _groupModel),
      getUnseenRecordingsCount(),
    ]);

    if (mounted) {
      setState(() {
        _badgeVisible = results[0] as bool;
        _badgeLabel = results[1] as int;
      });
    }
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
        return RenameDialog(
          initialName: oldName,
          title: AppLocalizations.of(context)!.renameGroup,
          existingNames: const [],
          onAccept: (String newName) {
            setState(() {
              _stopwatchesPageController.name = newName;
            });
          },
        );
      },
    );
  }
}
