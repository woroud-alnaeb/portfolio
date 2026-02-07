import 'package:flutter/material.dart';

/// Layout constraints used for spacing and sizing - following your Skoohub pattern
abstract class LayoutConstrains {
  LayoutConstrains._();

  static const double s1 = 4.0;
  static const double s2 = 8.0;
  static const double s3 = 12.0;
  static const double m1 = 16.0;
  static const double m2 = 20.0;
  static const double m3 = 24.0;
  static const double m4 = 32.0;
  static const double l1 = 40.0;
  static const double l2 = 48.0;
  static const double l3 = 56.0;
  static const double xl1 = 64.0;
  static const double xl2 = 80.0;
  static const double xl3 = 96.0;
  static const double xxl1 = 120.0;
  static const double xxl2 = 160.0;
}

/// Radius values for various UI components
abstract class PRadius {
  PRadius._();

  static const double rounded = 32.0;
  static const double button = 12.0;
  static const double container = 16.0;
  static const double card = 20.0;
  static const double chip = 24.0;
  static const double circle = 100.0;
  static const double glass = 24.0;
}

/// Padding utilities
abstract class PEdgeInsets {
  PEdgeInsets._();

  static const EdgeInsets all = EdgeInsets.all(LayoutConstrains.m3);
  static const EdgeInsets horizontal = EdgeInsets.symmetric(
    horizontal: LayoutConstrains.m3,
  );
  static const EdgeInsets vertical = EdgeInsets.symmetric(
    vertical: LayoutConstrains.m3,
  );
  static const EdgeInsets section = EdgeInsets.symmetric(
    horizontal: LayoutConstrains.m3,
    vertical: LayoutConstrains.xl1,
  );
  static const EdgeInsets screen = EdgeInsets.symmetric(
    horizontal: LayoutConstrains.m2,
  );
}

/// Responsive breakpoints
abstract class Breakpoints {
  Breakpoints._();

  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  static const double wide = 1440;
}

/// Max content width for centering on large screens
abstract class MaxWidth {
  MaxWidth._();

  static const double content = 1200;
  static const double narrow = 800;
  static const double wide = 1400;
}
