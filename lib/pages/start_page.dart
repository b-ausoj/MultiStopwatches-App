import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/start_page_controller.dart';
import 'package:multistopwatches/enums/start_page_card_menu_item.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/pages/stopwatches_page.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/widgets/dialogs/delete_group_dialog.dart';
import 'package:multistopwatches/widgets/dialogs/rename_dialog.dart';
import 'package:multistopwatches/widgets/icons/navigation_icon.dart';
import 'package:multistopwatches/widgets/navigation_drawer.dart';
import 'package:multistopwatches/widgets/popup_menu_buttons/start_page_popup_menu_button.dart';
import 'package:multistopwatches/widgets/text_with_badge/start_text_with_badge.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multistopwatches/main.dart';

class StartPage extends StatefulWidget {
  final String sharedPreferencesKey;
  const StartPage({required this.sharedPreferencesKey, super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late final StartController _startController;

  @override
  void initState() {
    super.initState();
    _startController =
        StartController(() => setState(() {}), widget.sharedPreferencesKey);
    loadStart(_startController).then((_) {
      // Apply saved language preference
      if (_startController.settings.languageCode != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          MyApp.of(context)?.setLocale(Locale(_startController.settings.languageCode!));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.multiStopwatches),
        leading: NavIcon(_startController),
      ),
      drawer: NavDrawer(_startController.allGroups, _startController.settings,
          _startController, null, _startController.sharedPreferencesKey),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Welcome to the MultiStopwatches app by Josua"),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ..._startController.allGroups.map((GroupModel group) => Card(
                        clipBehavior: Clip.antiAlias,
                        color: const Color(0xFFEFEFEF),
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
                                .then((value) {
                              _startController.refreshBadgeState();
                              setState(() {});
                            });
                          },
                        ),
                      )),
                  Card(
                    // Add new Group
                    margin: const EdgeInsets.symmetric(
                        horizontal: 90.0, vertical: 4.0),
                    color: const Color(0xFFEFEFEF),
                    elevation: 0,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(12.0),
                        onTap: () {
                          GroupModel newGroup = GroupModel(
                              AppLocalizations.of(context)!.group(_startController.allGroups.length + 1),
                              0,
                              _startController.settings.defaultSortCriterion,
                              _startController.settings.defaultSortDirection,
                              []);
                          _startController.allGroups.add(newGroup);
                          _startController.refreshBadgeState();
                          setState(() {});
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => StopwatchesPage(
                                      newGroup,
                                      _startController.allGroups,
                                      _startController.settings,
                                      _startController.sharedPreferencesKey)))
                              .then((value) {
                            _startController.refreshBadgeState();
                            setState(() {});
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.addNewGroup,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              const Icon(Icons.add_to_photos_outlined)
                            ],
                          ),
                        )),
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
            setState(() {});
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
        return RenameDialog(groupModel.name, (String newName) {
          groupModel.name = newName;
          setState(() {});
        });
      },
    );
  }
}
