import 'package:betterrank/config/config.dart';
import 'package:betterrank/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpRouterApp(
    String? location,
    Widget Function(Widget child) builder,
  ) {
    return pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: AppRouter().router(initialLocation: location),
      ),
    );
  }
}
