import 'package:betterrank/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ErrorTranslator {
  static String translate({
    required BuildContext context,
    required String error,
  }) {
    final l10n = context.l10n;

    if (error.contains('missing-profile-name')) {
      return l10n.empty_profile_name;
    } else if (error.contains('name-already-exists')) {
      return l10n.profile_name_taken;
    } else {
      return error;
    }
  }
}
