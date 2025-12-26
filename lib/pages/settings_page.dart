import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/csv_delimiter.dart';
import 'package:multistopwatches/enums/sort_criterion.dart';
import 'package:multistopwatches/enums/sort_direction.dart';
import 'package:multistopwatches/enums/time_format.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/widgets/icons/back_icon.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/main.dart';

class SettingsPage extends StatefulWidget {
  final bool isBadgeVisible;
  final SettingsModel settings;
  const SettingsPage(this.isBadgeVisible, this.settings, {super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
          leading: BackIcon(widget.isBadgeVisible),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    AppLocalizations.of(context)!.seperateRunningStoppedSetting,
                    style: const TextStyle(fontSize: 16),
                  )),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Switch(
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.white,
                    value: widget.settings.seperateRunningStopped,
                    onChanged: (value) {
                      setState(() {
                        widget.settings.seperateRunningStopped = value;
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
                      label: criterion.label,
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
                      label: direction.label,
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
                      label: csvDelimiter.label,
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
                DropdownMenu<String?>(
                  initialSelection: widget.settings.languageCode,
                  onSelected: (String? languageCode) {
                    setState(() {
                      widget.settings.languageCode = languageCode;
                    });
                    storeSettings(widget.settings);
                    // Update the app locale
                    Locale? newLocale;
                    if (languageCode != null) {
                      newLocale = Locale(languageCode);
                    }
                    MyApp.of(context)?.setLocale(newLocale);
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry<String?>(
                      value: null,
                      label: AppLocalizations.of(context)!.languageAuto,
                    ),
                    DropdownMenuEntry<String?>(
                      value: 'en',
                      label: AppLocalizations.of(context)!.languageEnglish,
                    ),
                    DropdownMenuEntry<String?>(
                      value: 'de',
                      label: AppLocalizations.of(context)!.languageGerman,
                    ),
                  ],
                )
              ]),
            ),
          ],
        ));
  }
}
