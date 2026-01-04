import 'package:flutter/material.dart';

// Simple static class for button colors
class AppColors {
  // Light theme button colors
  static const startButtonLightBg = Color(0xFF1D7226);
  static const stopButtonLightBg = Color(0xFFBC2525);
  static const resumeButtonLightBg = Color(0xFF259030);
  static const lapButtonLightBg = Color(0xFFE5A426);
  static const disabledButtonLightBg = Color(0xFFBFBFBF);
  static const buttonLightFg = Colors.white;

  // Dark theme button colors
  static const startButtonDarkBg = Color(0xFF2E9B3A);
  static const stopButtonDarkBg = Color(0xFFE53935);
  static const resumeButtonDarkBg = Color(0xFF36B745);
  static const lapButtonDarkBg = Color(0xFFFFC107);
  static const disabledButtonDarkBg = Color(0xFF505050);
  static const buttonDarkFg = Colors.black;

  // Helper methods to get color based on brightness
  static Color startButtonBg(bool isDark) =>
      isDark ? startButtonDarkBg : startButtonLightBg;
  static Color stopButtonBg(bool isDark) =>
      isDark ? stopButtonDarkBg : stopButtonLightBg;
  static Color resumeButtonBg(bool isDark) =>
      isDark ? resumeButtonDarkBg : resumeButtonLightBg;
  static Color lapButtonBg(bool isDark) =>
      isDark ? lapButtonDarkBg : lapButtonLightBg;
  static Color disabledButtonBg(bool isDark) =>
      isDark ? disabledButtonDarkBg : disabledButtonLightBg;
  static Color buttonFg(bool isDark) => isDark ? buttonDarkFg : buttonLightFg;
}

// Light theme configuration
ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontSize: 20),
      bodyLarge: TextStyle(fontSize: 18),
      bodyMedium: TextStyle(fontSize: 16),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Colors.white),
      trackColor: WidgetStateProperty.all(Colors.black),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: Colors.black,
      surfaceTint: Colors.white,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    cardTheme: const CardThemeData(
      color: Color(0xFFEFEFEF),
      shadowColor: Colors.transparent,
      surfaceTintColor: Color(0xFF000000),
      elevation: 0,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xFFDFDFDF),
      surfaceTintColor: Color(0xFFFFFFFF),
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: Color(0xFFDFDFDF),
      surfaceTintColor: Color(0xFFFFFFFF),
    ),
    navigationDrawerTheme: const NavigationDrawerThemeData(
      backgroundColor: Color(0xFFDFDFDF),
      indicatorColor: Color(0xFFBFBFBF),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFDFDFDF)),
        surfaceTintColor: WidgetStatePropertyAll<Color>(Color(0xFFFFFFFF)),
      ),
    ),
  );
}

// Dark theme configuration
ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18),
      bodyMedium: TextStyle(fontSize: 16),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Colors.black),
      trackColor: WidgetStateProperty.all(Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF121212),
      primary: Colors.white,
      surfaceTint: const Color(0xFF121212),
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF121212)),
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardTheme: const CardThemeData(
      color: Color(0xFF1E1E1E),
      shadowColor: Colors.transparent,
      surfaceTintColor: Color(0xFFFFFFFF),
      elevation: 0,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xFF242424),
      surfaceTintColor: Color(0xFF000000),
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: Color(0xFF242424),
      surfaceTintColor: Color(0xFF000000),
    ),
    navigationDrawerTheme: const NavigationDrawerThemeData(
      backgroundColor: Color(0xFF242424),
      indicatorColor: Color(0xFF404040),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFF242424)),
        surfaceTintColor: WidgetStatePropertyAll<Color>(Color(0xFF000000)),
      ),
    ),
  );
}
