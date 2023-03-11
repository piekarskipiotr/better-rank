import 'package:betterrank/config/config.dart';
import 'package:flutter/material.dart';

enum SignInMethod { google, apple }

extension SignInMethodExtension on SignInMethod {
  String get logo {
    switch (this) {
      case SignInMethod.google:
        return 'assets/logos/google.svg';
      case SignInMethod.apple:
        return 'assets/logos/apple.svg';
    }
  }

  ColorFilter? get logoColorFilter {
    switch (this) {
      case SignInMethod.google:
        return null;
      case SignInMethod.apple:
        return ColorFilter.mode(
          AppTheme.isDarkMode() ? Colors.white : Colors.black,
          BlendMode.srcIn,
        );
    }
  }

  String get name {
    switch (this) {
      case SignInMethod.google:
        return 'Google';
      case SignInMethod.apple:
        return 'Apple';
    }
  }
}
