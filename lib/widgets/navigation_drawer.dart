import 'package:flutter/material.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/pages/about_page.dart';
import 'package:multistopwatches/pages/help_page.dart';
import 'package:multistopwatches/pages/recordings_page.dart';
import 'package:multistopwatches/pages/settings_page.dart';
import 'package:multistopwatches/pages/stopwatches_page.dart';
import 'package:multistopwatches/widgets/text_with_badge/group_nav_text_with_badge.dart';
import 'package:multistopwatches/widgets/text_with_badge/recordings_nav_text_with_badge.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class NavDrawer extends StatefulWidget {
  final List<GroupModel> allGroups;
  final SettingsModel settings;
  final GroupModel? group;
  final String sharedPreferencesKey;
  final bool isStartPage;
  final VoidCallback? onNavigationComplete;

  const NavDrawer(this.allGroups, this.settings, this.group,
      this.sharedPreferencesKey,
      {this.isStartPage = false, this.onNavigationComplete, super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  late int _selectedIndex =
      widget.group == null ? -1 : widget.allGroups.indexOf(widget.group!);

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        onDestinationSelected: handleGroupChanged,
        selectedIndex: _selectedIndex,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 16, 20),
            child: Text(
              AppLocalizations.of(context)!.multiStopwatches,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...widget.allGroups.map((GroupModel group) =>
              NavigationDrawerDestination(
                  icon: const Icon(Icons.timer_outlined),
                  label: Flexible(
                      child: GroupNavTextWithBadge(
                          name: group.name,
                          group: group,
                          allGroups: widget.allGroups)))),
          NavigationDrawerDestination(
              icon: const Icon(Icons.add),
              label: Text(AppLocalizations.of(context)!.addNewGroup)),
          const Divider(),
          NavigationDrawerDestination(
              icon: const Icon(Icons.history),
              label: RecordingsNavTextWithBadge(
                  name: AppLocalizations.of(context)!.recordings)),
          NavigationDrawerDestination(
              icon: const Icon(Icons.settings_outlined),
              label: Text(AppLocalizations.of(context)!.settings)),
          NavigationDrawerDestination(
              icon: const Icon(Icons.help_outline),
              label: Text(AppLocalizations.of(context)!.help)),
          NavigationDrawerDestination(
              icon: const Icon(Icons.info_outlined),
              label: Text(AppLocalizations.of(context)!.about)),
        ]);
  }

  void handleGroupChanged(int selectedIndex) {
    GroupModel? selectedGroup = widget.allGroups.elementAtOrNull(selectedIndex);

    if (selectedGroup != null) {
      // Navigate to a stopwatches page
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(
              builder: (context) => StopwatchesPage(
                  selectedGroup,
                  widget.allGroups,
                  widget.settings,
                  widget.sharedPreferencesKey)))
          .then((value) => widget.onNavigationComplete?.call());
    } else {
      int base = widget.allGroups.length;
      switch (selectedIndex - base) {
        case 0:
          // add group
          Navigator.pop(context);
          GroupModel newGroup = GroupModel.create(
              AppLocalizations.of(context)!.group(widget.allGroups.length + 1),
              widget.settings.defaultSortCriterion,
              widget.settings.defaultSortDirection, []);
          widget.allGroups.add(newGroup);
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => StopwatchesPage(
                      newGroup,
                      widget.allGroups,
                      widget.settings,
                      widget.sharedPreferencesKey)))
              .then((value) => widget.onNavigationComplete?.call());
          break;
        case 1:
          // recordings
          Navigator.pop(context);
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => RecordingsPage(widget.allGroups,
                      widget.settings, widget.sharedPreferencesKey)))
              .then((value) => widget.onNavigationComplete?.call());
          break;
        case 2:
          // settings
          Navigator.pop(context);
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => SettingsPage(widget.allGroups,
                      widget.settings, widget.sharedPreferencesKey)))
              .then((value) => widget.onNavigationComplete?.call());
          break;
        case 3:
          // help
          Navigator.pop(context);
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => HelpPage(widget.allGroups,
                      widget.settings, widget.sharedPreferencesKey)))
              .then((value) => widget.onNavigationComplete?.call());
          break;
        case 4:
          // about
          Navigator.pop(context);
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => AboutPage(widget.allGroups,
                      widget.settings, widget.sharedPreferencesKey)))
              .then((value) => widget.onNavigationComplete?.call());
          break;
        default:
          throw Exception("Invalid selectedGroup state");
      }
    }

    setState(() {
      _selectedIndex = selectedIndex;
    });
  }
}
