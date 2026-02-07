import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography styles using Poppins font
abstract class AppTypo {
  AppTypo._();

  /// Display - Hero headings
  static TextStyle displayLarge(BuildContext context) => GoogleFonts.poppins(
    fontSize: 72,
    fontWeight: FontWeight.w700,
    height: 1.1,
  );

  static TextStyle displayMedium(BuildContext context) => GoogleFonts.poppins(
    fontSize: 56,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static TextStyle displaySmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: 44,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  /// Headlines - Section titles
  static TextStyle headlineLarge(BuildContext context) => GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static TextStyle headlineMedium(BuildContext context) => GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static TextStyle headlineSmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  /// Titles - Card titles, subtitles
  static TextStyle titleLarge(BuildContext context) => GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static TextStyle titleMedium(BuildContext context) => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static TextStyle titleSmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  /// Body - Regular text
  static TextStyle bodyLarge(BuildContext context) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static TextStyle bodyMedium(BuildContext context) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static TextStyle bodySmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  /// Labels - Buttons, chips, tags
  static TextStyle labelLarge(BuildContext context) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.5,
  );

  static TextStyle labelMedium(BuildContext context) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.5,
  );

  static TextStyle labelSmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.5,
  );
}
