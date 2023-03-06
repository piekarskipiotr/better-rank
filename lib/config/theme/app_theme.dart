import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Colors.white.withOpacity(0.8),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: Colors.black.withOpacity(0.8),
  );

  static void initSystemChromeSettings() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top],
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
