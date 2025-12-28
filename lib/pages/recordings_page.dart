import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/recordings_page_controller.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/widgets/icons/back_icon.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class RecordingsPage extends StatefulWidget {
  final List<GroupModel> allGroups;
  final SettingsModel settings;

  const RecordingsPage(this.allGroups, this.settings, {super.key});

  @override
  State<RecordingsPage> createState() => _RecordingsPageState();
}

class _RecordingsPageState extends State<RecordingsPage>
    with SingleTickerProviderStateMixin {
  late final RecordingsPageController recordingsPageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.recordings),
        leading: BackIcon(recordingsPageController.badgeVisible),
          /* Removed because confusing for my dad
          actions: [
            RecordingsPagePopupMenuButton(
                onSelected: (RecordingsPageMenuItem item) {
              switch (item) {
                case RecordingsPageMenuItem.deleteAll:
                  recordingsPageController.deleteAllRecordings();
                  break;
                case RecordingsPageMenuItem.exportAll:
                  log("export all");
                  break;
              }
            })
          ],
          */
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: recordingsPageController.recordingsList.length,
          itemBuilder: (context, index) =>
              recordingsPageController.recordingsList[index],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadRecordings(recordingsPageController = RecordingsPageController(
            context, () => setState(() {}), widget.allGroups, widget.settings))
        .then((value) => null);
    recordingsPageController.refreshBadgeState();
    setState(() {});
  }
}
