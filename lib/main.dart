import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multistopwatches/pages/start_page.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/config/app_themes.dart';
import 'package:multistopwatches/enums/locale_setting.dart';

void main() {
  runApp(const MyApp());
}

// TODO: add donation link
// TODO: write help page
// TODO: write tutorial page
// TODO: add introduction screen

// TODO: add info popup dialog on how to add the app to homescreen (PWA)
// TODO: maybe could use AnimationWidgets and Listeners to optimize the live updates of the stopwatch time display
// TODO: Add error message also with corrupted groups and stopwatches

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settings = SettingsModel();
    await loadSettings(settings);
    setState(() {
      _locale = settings.locale.toLocale();
      _themeMode = settings.themeMode.toThemeMode();
    });
  }

  void setLocale(Locale? locale) {
    setState(() {
      _locale = locale;
    });
  }

  void setThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    //resetSharedPreferences();
    //logAllSharedPreferences();
    return MaterialApp(
      title: "MultiStopwatches",
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LocaleSetting.supportedLocales,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: _themeMode,
      home: const StartPage(
        sharedPreferencesKey: "key_v5",
      ),
    );
  }
}
