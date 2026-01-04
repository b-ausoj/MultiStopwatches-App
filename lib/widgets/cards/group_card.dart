import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/start_page_controller.dart';
import 'package:multistopwatches/enums/start_page_card_menu_item.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/pages/stopwatches_page.dart';
import 'package:multistopwatches/widgets/dialogs/delete_group_dialog.dart';
import 'package:multistopwatches/widgets/dialogs/rename_dialog.dart';
import 'package:multistopwatches/widgets/popup_menu_buttons/start_page_popup_menu_button.dart';
import 'package:multistopwatches/widgets/text_with_badge/start_text_with_badge.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class GroupCard extends StatelessWidget {
  final GroupModel group;
  final StartController startController;
  final VoidCallback onStateChanged;

  const GroupCard({
    required this.group,
    required this.startController,
    required this.onStateChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 16.0, right: 8.0),
        leading: const Icon(Icons.timer_outlined),
        title: Center(
            child: StartTextWithBadge(
                startController, startController.allGroups.indexOf(group))),
        trailing: StartPagePopupMenuButton(onSelected: (StartPageCardMenuItem item) {
          switch (item) {
            case StartPageCardMenuItem.rename:
              _showRenameDialog(context);
              break;
            case StartPageCardMenuItem.delete:
              _showDeleteGroupDialog(context);
              break;
          }
        }),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => StopwatchesPage(
                      group,
                      startController.allGroups,
                      startController.settings,
                      startController.sharedPreferencesKey)))
              .then((value) => onStateChanged());
        },
      ),
    );
  }

  Future<void> _showDeleteGroupDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DeleteGroupDialog(
          group.name,
          onAccept: () {
            startController.removeGroup(group);
            onStateChanged();
          },
        );
      },
    );
  }

  Future<String?> _showRenameDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return RenameDialog(
          initialName: group.name,
          title: AppLocalizations.of(context)!.renameGroup,
          existingNames: const [],
          onAccept: (String newName) {
            group.name = newName;
            onStateChanged();
          },
        );
      },
    );
  }
}
