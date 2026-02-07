import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'const.dart';

/// Light and Dark theme configurations
ThemeData getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppColors.primaryPurple,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryPurple,
      secondary: AppColors.primaryCyan,
      surface: AppColors.lightSurface,
      error: Color(0xFFDC2626),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.lightText,
      displayColor: AppColors.lightText,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColors.lightText,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstrains.m3,
          vertical: LayoutConstrains.m1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PRadius.button),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryPurple,
        side: const BorderSide(color: AppColors.primaryPurple),
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstrains.m3,
          vertical: LayoutConstrains.m1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PRadius.button),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PRadius.card),
      ),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.lightDivider),
    iconTheme: const IconThemeData(color: AppColors.primaryPurple),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.primaryPurple,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryPurple,
      secondary: AppColors.primaryCyan,
      surface: AppColors.darkSurface,
      error: Color(0xFFEF4444),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.darkText,
      displayColor: AppColors.darkText,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColors.darkText,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstrains.m3,
          vertical: LayoutConstrains.m1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PRadius.button),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryCyan,
        side: const BorderSide(color: AppColors.primaryCyan),
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstrains.m3,
          vertical: LayoutConstrains.m1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PRadius.button),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.darkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PRadius.card),
      ),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.darkDivider),
    iconTheme: const IconThemeData(color: AppColors.primaryCyan),
  );
}
