import 'package:flutter/material.dart';
import 'app.dart';
import 'theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemeProvider();

  runApp(App(themeProvider: themeProvider));
}
