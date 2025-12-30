import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multistopwatches/pages/start_page.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/models/settings_model.dart';
import 'package:multistopwatches/services/shared_preferences_service.dart';

void main() {
  runApp(const MyApp());
}

// TODO: add donation link
// TODO: write help page
// TODO: write tutorial page
// TODO: add introduction screen

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final settings = SettingsModel();
    await loadSettings(settings);
    if (settings.languageCode != null) {
      setState(() {
        _locale = Locale(settings.languageCode!);
      });
    }
  }

  void setLocale(Locale? locale) {
    setState(() {
      _locale = locale;
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
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('de', ''), // German
      ],
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 16),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(Colors.white),
          trackColor: WidgetStateProperty.all(Colors.black),
        ),
        // switchTheme: SwitchThemeData(
        //   thumbColor: WidgetStateProperty.resolveWith((states) {
        //     if (states.contains(WidgetState.selected)) {
        //       return Colors.white;
        //     }
        //     return Colors.grey;
        //   }),
        //   trackColor: WidgetStateProperty.resolveWith((states) {
        //     if (states.contains(WidgetState.selected)) {
        //       return Colors.black;
        //     }
        //     return Colors.white;
        //   }),
        // ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            primary: Colors.black,
            surfaceTint: Colors.white),
        // colorScheme: const ColorScheme.light(
        //   primary: Colors.black,
        //   surface: Colors.white,
        //   surfaceTint: Colors.transparent, // No tint on surfaces
        //   surfaceContainerHighest: Color(0xFFEFEFEF), // Card backgrounds
        //   surfaceContainer: Color(0xFFDFDFDF), // Dialog/menu backgrounds
        //   surfaceContainerHigh: Color(0xFFBFBFBF), // Disabled/inactive elements
        //   onSurfaceVariant: Color(0xFF757575), // Grey text (Colors.grey[600])
        //   onSurface: Colors.black, // Default text color
        // ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        cardTheme: const CardThemeData(
          color: Color(0xFFEFEFEF),
          elevation: 0,
        ),
        popupMenuTheme: const PopupMenuThemeData(
          color: Color(0xFFDFDFDF),
          surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
        ),
        dialogTheme: const DialogThemeData(
          backgroundColor: Color(0xFFDFDFDF),
          surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
        ),
        // navigationDrawerTheme: const NavigationDrawerThemeData(
        //   labelTextStyle: WidgetStatePropertyAll(
        //     TextStyle(color: Colors.black),
        //   ),
        //   iconTheme: WidgetStatePropertyAll(
        //     IconThemeData(color: Colors.black),
        //   ),
        // ),
        // iconTheme: const IconThemeData(color: Colors.black),
      ),
      home: const StartPage(
        sharedPreferencesKey: "key_v5",
      ),
    );
  }
}
