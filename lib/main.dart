import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multistopwatches/pages/start_page.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';
import 'package:multistopwatches/config/app_themes.dart';
import 'package:multistopwatches/enums/locale_setting.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {
  runApp(const MyApp());
}

// TODO: add donation link
// TODO: write help page => collection of info cards and some FAQ => add separate page for it
// TODO: write tutorial page => done with info cards on start page
// TODO: add introduction screen => done with info cards on start page

// TODO: SEO also in german

// TODO: add info popup dialog on how to add the app to homescreen (PWA)
// TODO: maybe could use AnimationWidgets and Listeners to optimize the live updates of the stopwatch time display
// TODO: Add error message also with corrupted groups and stopwatches
// TODO: let user select font size for stopwatch display (i.e. total time and lap times (easiest: both coupled together)) via a slider in settings
// TODO: let user rename recording groups (which would also name the exported files accordingly))

// TODO: Advanced feature: add keyboard shortcuts for web on desktop to control the stopwatches start/lap/stop
// TODO: let user decide which keys to use for the shortcuts, but easiest would be space for start all, and a single key for a stopwatch start/lap (user has to define it) and shift + that key for stop

// TODO: add tests for all the data persistence so when I change something at the data models, I can be sure that it is backward compatible
// TODO: add tests for shared preferences service (maybe is same as above?)

// TODO: add changelog to the readme with each release (version number, date, changes made)

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
      navigatorObservers: [routeObserver],
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
