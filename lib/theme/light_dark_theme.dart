import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const Color background = Color(0xFF1A1C1B);
  static const accent = Color(0xFFD6755B);
  static const IconBackground = Color(0xFF5D8A76);
  static const textDark = Color(0xFF53585A);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const cardLight = Color.fromARGB(33, 33, 33, 1);
  static const searchField = Color.fromARGB(65, 74, 69, 1);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light(ThemeData theme) => ThemeData(
        brightness: Brightness.light,
        colorScheme: theme.colorScheme.copyWith(
          secondary: accentColor,
          background: AppColors.background,
        ),
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        /*primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),*/
      );

  /// Dark theme and its settings.
  static ThemeData dark(ThemeData theme) => ThemeData(
        brightness: Brightness.dark,
        colorScheme: theme.colorScheme.copyWith(
          brightness: Brightness.dark, // Explicitly set brightness
          secondary: accentColor,
          background: AppColors.background,
        ),
        visualDensity: visualDensity,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: AppColors.textLigth,
        ),
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
      );
}
