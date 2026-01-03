import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/csv_delimiter.dart';
import 'package:multistopwatches/enums/locale_setting.dart';
import 'package:multistopwatches/enums/sort_criterion.dart';
import 'package:multistopwatches/enums/sort_direction.dart';
import 'package:multistopwatches/enums/time_format.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/models/group_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/widgets/icons/navigation_icon.dart';
import 'package:multistopwatches/widgets/navigation_drawer.dart';
import 'package:multistopwatches/utils/badge_checking.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/main.dart';
import 'package:multistopwatches/enums/theme_mode_setting.dart';

class SettingsPage extends StatefulWidget {
  final List<GroupModel> allGroups;
  final SettingsModel settings;
  final String sharedPreferencesKey;
  const SettingsPage(this.allGroups, this.settings, this.sharedPreferencesKey, {super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _badgeVisible = false;
  int _badgeLabel = 0;

  @override
  void initState() {
    super.initState();
    _loadBadgeState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
          leading: NavIcon(_badgeVisible, _badgeLabel),
        ),
        drawer: NavDrawer(
            widget.allGroups, widget.settings, null, widget.sharedPreferencesKey),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    AppLocalizations.of(context)!.separateRunningStoppedSetting,
                    style: const TextStyle(fontSize: 16),
                  )),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Switch(
                    value: widget.settings.separateRunningStopped,
                    onChanged: (value) {
                      setState(() {
                        widget.settings.separateRunningStopped = value;
                      });
                      storeSettings(widget.settings);
                    },
                  )
                ],
              ),
            ),
            const Divider(
              indent: 16.0,
              endIndent: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                Expanded(
                    child: Text(
                  AppLocalizations.of(context)!.defaultSortCriterion,
                  style: const TextStyle(fontSize: 16),
                )),
                const SizedBox(
                  width: 16.0,
                ),
                DropdownMenu<SortCriterion>(
                  initialSelection: widget.settings.defaultSortCriterion,
                  onSelected: (SortCriterion? criterion) {
                    if (criterion != null) {
                      setState(() {
                        widget.settings.defaultSortCriterion = criterion;
                      });
                      storeSettings(widget.settings);
                    }
                  },
                  dropdownMenuEntries: SortCriterion.values
                      .map<DropdownMenuEntry<SortCriterion>>(
                          (SortCriterion criterion) {
                    return DropdownMenuEntry<SortCriterion>(
                      value: criterion,
                      label: criterion.label(context),
                    );
                  }).toList(),
                )
              ]),
            ),
            if (widget.settings.defaultSortCriterion !=
                SortCriterion.customReordable)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: [
                  Expanded(
                      child: Text(
                    AppLocalizations.of(context)!.defaultSortDirection,
                    style: const TextStyle(fontSize: 16),
                  )),
                  const SizedBox(
                    width: 16.0,
                  ),
                  DropdownMenu<SortDirection>(
                    initialSelection: widget.settings.defaultSortDirection,
                    onSelected: (SortDirection? direction) {
                      if (direction != null) {
                        setState(() {
                          widget.settings.defaultSortDirection = direction;
                        });
                        storeSettings(widget.settings);
                      }
                    },
                    dropdownMenuEntries: SortDirection.values
                        .map<DropdownMenuEntry<SortDirection>>(
                            (SortDirection direction) {
                      return DropdownMenuEntry<SortDirection>(
                        value: direction,
                        label: direction.label(context),
                      );
                    }).toList(),
                  )
                ]),
              )
            else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppLocalizations.of(context)!.customSortExplanation,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            const Divider(
              indent: 16.0,
              endIndent: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                Expanded(
                    child: Text(
                  AppLocalizations.of(context)!.timeformatCsvExport,
                  style: const TextStyle(fontSize: 16),
                )),
                const SizedBox(
                  width: 16.0,
                ),
                DropdownMenu<TimeFormat>(
                  initialSelection: widget.settings.timeFormat,
                  onSelected: (TimeFormat? timeFormat) {
                    if (timeFormat != null) {
                      setState(() {
                        widget.settings.timeFormat = timeFormat;
                      });
                      storeSettings(widget.settings);
                    }
                  },
                  dropdownMenuEntries: TimeFormat.values
                      .map<DropdownMenuEntry<TimeFormat>>(
                          (TimeFormat timeFormat) {
                    return DropdownMenuEntry<TimeFormat>(
                      value: timeFormat,
                      label: timeFormat.value,
                    );
                  }).toList(),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                Expanded(
                    child: Text(
                  AppLocalizations.of(context)!.delimiterCsvFile,
                  style: const TextStyle(fontSize: 16),
                )),
                const SizedBox(
                  width: 16.0,
                ),
                DropdownMenu<CSVDelimiter>(
                  initialSelection: widget.settings.csvDelimiter,
                  onSelected: (CSVDelimiter? csvDelimiter) {
                    if (csvDelimiter != null) {
                      setState(() {
                        widget.settings.csvDelimiter = csvDelimiter;
                      });
                      storeSettings(widget.settings);
                    }
                  },
                  dropdownMenuEntries: CSVDelimiter.values
                      .map<DropdownMenuEntry<CSVDelimiter>>(
                          (CSVDelimiter csvDelimiter) {
                    return DropdownMenuEntry<CSVDelimiter>(
                      value: csvDelimiter,
                      label: csvDelimiter.label(context),
                    );
                  }).toList(),
                )
              ]),
            ),
            const Divider(
              indent: 16.0,
              endIndent: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                Expanded(
                    child: Text(
                  AppLocalizations.of(context)!.language,
                  style: const TextStyle(fontSize: 16),
                )),
                const SizedBox(
                  width: 16.0,
                ),
                DropdownMenu<LocaleSetting>(
                  initialSelection: widget.settings.locale,
                  onSelected: (LocaleSetting? locale) {
                    if (locale != null) {
                      setState(() {
                        widget.settings.locale = locale;
                      });
                      storeSettings(widget.settings);
                      // Update the app locale
                      MyApp.of(context)?.setLocale(locale.toLocale());
                    }
                  },
                  dropdownMenuEntries: LocaleSetting.values
                      .map<DropdownMenuEntry<LocaleSetting>>(
                          (LocaleSetting locale) {
                    return DropdownMenuEntry<LocaleSetting>(
                      value: locale,
                      label: locale.label(context),
                    );
                  }).toList(),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                Expanded(
                    child: Text(
                  AppLocalizations.of(context)!.themeMode,
                  style: const TextStyle(fontSize: 16),
                )),
                const SizedBox(
                  width: 16.0,
                ),
                DropdownMenu<ThemeModeSetting>(
                  initialSelection: widget.settings.themeMode,
                  onSelected: (ThemeModeSetting? themeMode) {
                    if (themeMode != null) {
                      setState(() {
                        widget.settings.themeMode = themeMode;
                      });
                      storeSettings(widget.settings);
                      // Update the app theme mode
                      MyApp.of(context)?.setThemeMode(themeMode.toThemeMode());
                    }
                  },
                  dropdownMenuEntries: ThemeModeSetting.values
                      .map<DropdownMenuEntry<ThemeModeSetting>>(
                          (ThemeModeSetting themeMode) {
                    return DropdownMenuEntry<ThemeModeSetting>(
                      value: themeMode,
                      label: themeMode.label(context),
                    );
                  }).toList(),
                )
              ]),
            ),
          ],
        ));
  }
}
