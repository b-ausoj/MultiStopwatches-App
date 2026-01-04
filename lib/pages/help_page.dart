import 'package:flutter/material.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/widgets/icons/navigation_icon.dart';
import 'package:multistopwatches/widgets/navigation_drawer.dart';
import 'package:multistopwatches/widgets/cards/info_card.dart';
import 'package:multistopwatches/utils/badge_checking.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/main.dart' as main;

class HelpPage extends StatefulWidget {
  final List<GroupModel> allGroups;
  final SettingsModel settings;
  final String sharedPreferencesKey;
  const HelpPage(this.allGroups, this.settings, this.sharedPreferencesKey,
      {super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> with RouteAware {
  bool _badgeVisible = false;
  int _badgeLabel = 0;

  @override
  void initState() {
    super.initState();
    _loadBadgeState();
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

  @override
  void dispose() {
    main.routeObserver.unsubscribe(this);
    super.dispose();
  }

  Future<void> _loadBadgeState() async {
    final results = await Future.wait([
      isMenuBadgeRequired(widget.allGroups, null),
      getUnseenRecordingsCount(),
    ]);

    if (mounted) {
      setState(() {
        _badgeVisible = results[0] as bool;
        _badgeLabel = results[1] as int;
      });
    }
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helpPageTitle),
        leading: NavIcon(_badgeVisible, _badgeLabel),
      ),
      drawer: NavDrawer(
          widget.allGroups, widget.settings, null, widget.sharedPreferencesKey),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildSectionHeader(
                AppLocalizations.of(context)!.gettingStartedSection),
            InfoCard(
              message: AppLocalizations.of(context)!.noGroupsHint,
            ),
            _buildSectionHeader(
                AppLocalizations.of(context)!.stopwatchesSection),
            InfoCard(
              message: AppLocalizations.of(context)!.noStopwatchesHint,
            ),
            InfoCard(
              message: AppLocalizations.of(context)!.sortingHint,
            ),
            InfoCard(
              message: AppLocalizations.of(context)!.savingHint,
            ),
            _buildSectionHeader(
                AppLocalizations.of(context)!.recordingsSection),
            InfoCard(
              message: AppLocalizations.of(context)!.noRecordingsHint,
            ),
            InfoCard(
              message: AppLocalizations.of(context)!.exportRecordingsHint,
            ),
            _buildSectionHeader(AppLocalizations.of(context)!.contactSection),
            InfoCard(
              message: AppLocalizations.of(context)!.contactHint,
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
