import 'package:betterrank/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum ImageButtonType {
  cover,
  choice,
}

extension ImageButtonTypeExtension on ImageButtonType {
  String getAddName(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case ImageButtonType.cover:
        return l10n.add_cover_image;
      case ImageButtonType.choice:
        return l10n.add_choice;
    }
  }
}