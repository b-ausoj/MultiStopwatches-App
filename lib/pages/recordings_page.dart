import 'package:flutter/material.dart';
import 'package:flutter_stopwatch_app_v1/controllers/recordings_page_controller.dart';
import 'package:flutter_stopwatch_app_v1/models/settings_model.dart';
import 'package:flutter_stopwatch_app_v1/models/setup_model.dart';
import 'package:flutter_stopwatch_app_v1/services/shared_preferences_service.dart';
import 'package:flutter_stopwatch_app_v1/widgets/icons/back_icon.dart';

class RecordingsPage extends StatefulWidget {
  final List<SetupModel> allSetups;
  final SettingsModel settings;

  const RecordingsPage(this.allSetups, this.settings, {super.key});

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
        title: const Text("Recordings"),
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
            context, () => setState(() {}), widget.allSetups, widget.settings))
        .then((value) => null);
    recordingsPageController.refreshBadgeState();
    setState(() {});
  }
}
