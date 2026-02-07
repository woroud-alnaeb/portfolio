import 'package:flutter/material.dart';

/// Color system for the portfolio - supports light and dark themes
/// Following the confirmed design: Navy + Purple + Cyan gradients
abstract class AppColors {
  AppColors._();

  // === Primary Brand Colors ===
  static const Color primaryPurple = Color(0xFF6C63FF);
  static const Color primaryCyan = Color(0xFF00D9FF);
  static const Color primaryPink = Color(0xFFFF6B9D);

  // === Brighter accent for better contrast on dark ===
  static const Color chipPurple = Color(0xFF8B85FF); // Brighter for chips

  // === Dark Theme Colors ===
  static const Color darkBackground = Color(0xFF0A0E27);
  static const Color darkSurface = Color(0xFF1A1F3D);
  static const Color darkCard = Color(0xFF252A4A);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkTextSecondary =
      Color(0xFFB8BDD1); // Brighter for visibility
  static const Color darkDivider = Color(0xFF2A2F4F);

  // === Light Theme Colors ===
  static const Color lightBackground = Color(0xFFF5F7FA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF1A1F3D);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color lightDivider = Color(0xFFE5E7EB);

  // === Glassmorphism ===
  static Color glassLight = Colors.white.withOpacity(0.1);
  static Color glassDark = Colors.white.withOpacity(0.05);
  static Color glassBorder = Colors.white.withOpacity(0.2);

  // === Gradient Colors ===
  static const List<Color> primaryGradient = [primaryPurple, primaryCyan];

  static const List<Color> heroGradient = [
    Color(0xFF6C63FF),
    Color(0xFF00D9FF),
    Color(0xFFFF6B9D),
  ];

  static const List<Color> orbGradient1 = [
    Color(0xFF6C63FF),
    Color(0xFF00D9FF),
  ];

  static const List<Color> orbGradient2 = [
    Color(0xFFFF6B9D),
    Color(0xFF6C63FF),
  ];

  static const List<Color> orbGradient3 = [
    Color(0xFF00D9FF),
    Color(0xFF00FFB2),
  ];
}
