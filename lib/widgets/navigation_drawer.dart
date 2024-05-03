import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/badge_controller.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/pages/about_page.dart';
import 'package:multistopwatches/pages/recordings_page.dart';
import 'package:multistopwatches/pages/settings_page.dart';
import 'package:multistopwatches/pages/stopwatches_page.dart';
import 'package:multistopwatches/utils/badge_checking.dart';
import 'package:multistopwatches/widgets/text_with_badge/nav_text_with_badge.dart';

class NavDrawer extends StatefulWidget {
  final List<GroupModel> allGroups;
  final SettingsModel settings;
  // add list of startControllers so that if we open the drawer from start page and
  // then navigate to a group and go back per arrows (back wishing)
  // the badge will be updated
  final BadgeController controller;
  final GroupModel? group;
  const NavDrawer(this.allGroups, this.settings, this.controller, this.group,
      {super.key});

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
        backgroundColor: const Color(0xFFDFDFDF),
        indicatorColor: const Color(0xFFBFBFBF),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 16, 20),
            child: Text(
              "MultiStopwatches",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...widget.allGroups.map((GroupModel group) =>
              NavigationDrawerDestination(
                  icon: const Icon(Icons.timer_outlined),
                  label: Flexible(
                      child: NavTextWithBadge(
                          group.name, group, widget.allGroups, false)))),
          const NavigationDrawerDestination(
              icon: Icon(Icons.add), label: Text("Add a new group")),
          const Divider(),
          const NavigationDrawerDestination(
              icon: Icon(Icons.history),
              label: NavTextWithBadge("Recordings", null, null, true)),
          const NavigationDrawerDestination(
              icon: Icon(Icons.settings_outlined), label: Text("Settings")),
          const NavigationDrawerDestination(
              icon: Icon(Icons.info_outlined), label: Text("About")),
        ]);
  }

  void handleGroupChanged(int selectedIndex) {
    GroupModel? selectedGroup = widget.allGroups.elementAtOrNull(selectedIndex);

    if (selectedGroup != null) {
      // group x
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(
              builder: (context) => StopwatchesPage(
                  selectedGroup, widget.allGroups, widget.settings)))
          .then((value) => widget.controller.refreshBadgeState());
    } else {
      int base = widget.allGroups.length;
      switch (selectedIndex - base) {
        case 0:
          // add group
          Navigator.pop(context);
          GroupModel newGroup = GroupModel(
              "Group ${widget.allGroups.length + 1}",
              0,
              widget.settings.defaultSortCriterion,
              widget.settings.defaultSortDirection, []);
          widget.allGroups.add(newGroup);
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => StopwatchesPage(
                      newGroup, widget.allGroups, widget.settings)))
              .then((value) => widget.controller.refreshBadgeState());
          break;
        case 1:
          // recordings
          Navigator.pop(context);
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) =>
                      RecordingsPage(widget.allGroups, widget.settings)))
              .then((value) => widget.controller.refreshBadgeState());
          break;
        case 2:
          // settings
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SettingsPage(
                  isBackBadgeRequired(widget.allGroups), widget.settings)));
          break;
        case 3:
          // about
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  AboutPage(isBackBadgeRequired(widget.allGroups))));

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
