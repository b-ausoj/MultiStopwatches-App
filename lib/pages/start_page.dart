import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/start_page_controller.dart';
import 'package:multistopwatches/enums/start_page_card_menu_item.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/pages/stopwatches_page.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/utils/badge_checking.dart';
import 'package:multistopwatches/widgets/cards/add_group_card.dart';
import 'package:multistopwatches/widgets/dialogs/delete_group_dialog.dart';
import 'package:multistopwatches/widgets/dialogs/rename_dialog.dart';
import 'package:multistopwatches/widgets/icons/navigation_icon.dart';
import 'package:multistopwatches/widgets/navigation_drawer.dart';
import 'package:multistopwatches/widgets/popup_menu_buttons/start_page_popup_menu_button.dart';
import 'package:multistopwatches/widgets/text_with_badge/start_text_with_badge.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/main.dart' as main;

class StartPage extends StatefulWidget {
  final String sharedPreferencesKey;
  const StartPage({required this.sharedPreferencesKey, super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with RouteAware {
  late final StartController _startController;
  bool _badgeVisible = false;
  int _badgeLabel = 0;

  @override
  void initState() {
    super.initState();
    _startController =
        StartController(() => setState(() {}), widget.sharedPreferencesKey);
    loadStart(_startController).then((_) => _loadBadgeState());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    main.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPopNext() {
    _loadBadgeState();
  }

  Future<void> _loadBadgeState() async {
    final results = await Future.wait([
      isMenuBadgeRequired(_startController.allGroups, null),
      getUnseenRecordingsCount(),
    ]);

    if (mounted) {
      setState(() {
        _badgeVisible = results[0] as bool;
        _badgeLabel = results[1] as int;
        _startController.updateGroupBadges();
      });
    }
  }

  @override
  void dispose() {
    main.routeObserver.unsubscribe(this);
    _startController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.multiStopwatches),
        leading: NavIcon(_badgeVisible, _badgeLabel),
      ),
      drawer: NavDrawer(_startController.allGroups, _startController.settings,
          null, _startController.sharedPreferencesKey,
          isStartPage: true, onNavigationComplete: _loadBadgeState),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.welcomeMessage),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ..._startController.allGroups.map((GroupModel group) => Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 16.0, right: 8.0),
                          leading: const Icon(Icons.timer_outlined),
                          title: Center(
                              child: StartTextWithBadge(_startController,
                                  _startController.allGroups.indexOf(group))),
                          trailing: StartPagePopupMenuButton(
                              onSelected: (StartPageCardMenuItem item) {
                            switch (item) {
                              case StartPageCardMenuItem.rename:
                                _showRenameDialog(group);
                                break;
                              case StartPageCardMenuItem.delete:
                                _showDeleteGroupDialog(group);
                                break;
                            }
                          }),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => StopwatchesPage(
                                        group,
                                        _startController.allGroups,
                                        _startController.settings,
                                        _startController.sharedPreferencesKey)))
                                .then((value) => _loadBadgeState());
                          },
                        ),
                      )),
                  AddGroupCard(
                    startController: _startController,
                    onGroupAdded: () => setState(() {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDeleteGroupDialog(GroupModel groupModel) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DeleteGroupDialog(
          groupModel.name,
          onAccept: () {
            _startController.removeGroup(groupModel);
            _loadBadgeState();
          },
        );
      },
    );
  }

  Future<String?> _showRenameDialog(GroupModel groupModel) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return RenameDialog(
          initialName: groupModel.name,
          title: AppLocalizations.of(context)!.renameGroup,
          existingNames: const [],
          onAccept: (String newName) {
            groupModel.name = newName;
            setState(() {});
          },
        );
      },
    );
  }
}
