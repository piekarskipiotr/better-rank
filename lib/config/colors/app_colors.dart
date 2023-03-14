import 'package:flutter/material.dart';

class AppColors {
  static const primaryBlue = Color(0xFF053CE0);
  static const pinkPurple = Color(0xFF7543B4);
  static const purple = Color(0xFF670CFF);
  static const pink = Color(0xFFEA0AD3);
  static const red = Color(0xFFE94A4A);
  static const darkGray = Color(0xFF1C1C1C);
  static const yellow = Color(0xFFE9EC4F);

  static MaterialColor toMaterialColor(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = color.red;
    final g = color.green;
    final b = color.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
