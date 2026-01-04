import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/start_page_controller.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/utils/badge_checking.dart';
import 'package:multistopwatches/widgets/cards/add_group_card.dart';
import 'package:multistopwatches/widgets/cards/group_card.dart';
import 'package:multistopwatches/widgets/cards/info_card.dart';
import 'package:multistopwatches/widgets/icons/navigation_icon.dart';
import 'package:multistopwatches/widgets/navigation_drawer.dart';
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
                  if (_startController.allGroups.isEmpty)
                    InfoCard(
                      message: AppLocalizations.of(context)!.noGroupsHint,
                    ),
                  ..._startController.allGroups
                      .map((GroupModel group) => GroupCard(
                            group: group,
                            startController: _startController,
                            onStateChanged: _loadBadgeState,
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
}
