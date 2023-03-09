import 'package:betterrank/app/view/app_background/app_background.dart';
import 'package:betterrank/config/config.dart';
import 'package:betterrank/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      app: MaterialApp.router(
        // router
        routerConfig: AppRouter().router,

        // app theme
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,

        // localizations
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,

        // others
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
