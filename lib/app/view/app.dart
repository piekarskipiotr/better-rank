import 'package:betterrank/app/view/app_background/app_background.dart';
import 'package:betterrank/config/config.dart';
import 'package:betterrank/di/get_it.dart';
import 'package:betterrank/l10n/l10n.dart';
import 'package:betterrank/widgets/loading/bloc/loading_overlay_cubit.dart';
import 'package:betterrank/widgets/loading/view/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      app: MaterialApp.router(
        // router
        routerConfig: AppRouter().router(),
        builder: (context, child) => BlocProvider.value(
          value: getIt<LoadingOverlayCubit>(),
          child: LoadingOverlay(
            child: child ?? Container(),
          ),
        ),

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
