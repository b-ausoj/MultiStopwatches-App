import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/start_page_controller.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/pages/stopwatches_page.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class AddGroupCard extends StatelessWidget {
  final StartController startController;
  final VoidCallback onGroupAdded;

  const AddGroupCard({
    required this.startController,
    required this.onGroupAdded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 4.0),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () {
          GroupModel newGroup = GroupModel(
              AppLocalizations.of(context)!
                  .group(startController.allGroups.length + 1),
              0,
              startController.settings.defaultSortCriterion,
              startController.settings.defaultSortDirection,
              []);
          startController.allGroups.add(newGroup);
          startController.refreshBadgeState();
          onGroupAdded();
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => StopwatchesPage(
                      newGroup,
                      startController.allGroups,
                      startController.settings,
                      startController.sharedPreferencesKey)))
              .then((value) {
            startController.refreshBadgeState();
            onGroupAdded();
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
        ),
      ),
    );
  }
}
