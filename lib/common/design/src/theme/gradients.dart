import 'package:flutter/material.dart';
import 'colors.dart';

/// Pre-defined gradients for the portfolio
abstract class AppGradients {
  AppGradients._();

  /// Primary purple to cyan gradient
  static const LinearGradient primary = LinearGradient(
    colors: AppColors.primaryGradient,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Hero section background gradient
  static const LinearGradient heroBackground = LinearGradient(
    colors: [
      AppColors.darkBackground,
      Color(0xFF0F1535),
      AppColors.darkSurface,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Card hover gradient
  static const LinearGradient cardHover = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF00D9FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Orb gradient 1 - Purple to Cyan
  static const RadialGradient orb1 = RadialGradient(
    colors: [Color(0xFF6C63FF), Color(0x006C63FF)],
    center: Alignment.center,
    radius: 0.8,
  );

  /// Orb gradient 2 - Pink to Purple
  static const RadialGradient orb2 = RadialGradient(
    colors: [Color(0xFFFF6B9D), Color(0x00FF6B9D)],
    center: Alignment.center,
    radius: 0.8,
  );

  /// Orb gradient 3 - Cyan to Green
  static const RadialGradient orb3 = RadialGradient(
    colors: [Color(0xFF00D9FF), Color(0x0000D9FF)],
    center: Alignment.center,
    radius: 0.8,
  );

  /// Text gradient for headings
  static const LinearGradient textGradient = LinearGradient(
    colors: AppColors.primaryGradient,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Glass effect gradient
  static LinearGradient glass = LinearGradient(
    colors: [Colors.white.withOpacity(0.15), Colors.white.withOpacity(0.05)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
