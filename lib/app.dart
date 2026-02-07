import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'theme_provider.dart';
import 'presentation/home/home_screen.dart';

class App extends StatelessWidget {
  final ThemeProvider themeProvider;

  const App({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeProvider,
      builder: (context, _) {
        return MaterialApp(
          title: 'Woroud Alnaeb - Senior Flutter Developer',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.lightTheme,
          darkTheme: themeProvider.darkTheme,
          themeMode: themeProvider.themeMode,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
            },
          ),
          home: HomeScreen(themeProvider: themeProvider),
        );
      },
    );
  }
}
