import 'package:flutter/material.dart';
import 'package:multistopwatches/controllers/recordings_page_controller.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/utils/badge_checking.dart';
import 'package:multistopwatches/widgets/dialogs/data_error_dialog.dart';
import 'package:multistopwatches/widgets/icons/navigation_icon.dart';
import 'package:multistopwatches/widgets/navigation_drawer.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/main.dart' as main;

class RecordingsPage extends StatefulWidget {
  final List<GroupModel> allGroups;
  final SettingsModel settings;
  final String sharedPreferencesKey;

  const RecordingsPage(this.allGroups, this.settings, this.sharedPreferencesKey,
      {super.key});

  @override
  State<RecordingsPage> createState() => _RecordingsPageState();
}

class _RecordingsPageState extends State<RecordingsPage>
    with SingleTickerProviderStateMixin, RouteAware {
  late final RecordingsPageController recordingsPageController;
  bool _badgeVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.recordings),
        leading: NavIcon(_badgeVisible, 0),
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
      drawer: NavDrawer(
          widget.allGroups, widget.settings, null, widget.sharedPreferencesKey),
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
    recordingsPageController = RecordingsPageController(
        () => setState(() {}), widget.allGroups, widget.settings);

    loadRecordings(recordingsPageController).then((value) {
      if (!mounted) return;

      recordingsPageController.createRecordingList(context);
      recordingsPageController.refresh();

      // Show error dialog if there were corrupted recordings
      if (recordingsPageController.corruptedRecordingsCount > 0) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DataErrorDialog(
                  corruptedRecordingsCount:
                      recordingsPageController.corruptedRecordingsCount,
                );
              },
            );
          }
        });
      }
    });

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

  void _loadBadgeState() {
    setState(() {
      _badgeVisible = isBackBadgeRequired(widget.allGroups);
    });
  }
}
