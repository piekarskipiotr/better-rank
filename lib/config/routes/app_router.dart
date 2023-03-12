import 'package:betterrank/config/config.dart';
import 'package:betterrank/di/get_it.dart';
import 'package:betterrank/pages/sign_in/bloc/auth_bloc.dart';
import 'package:betterrank/pages/sign_in/view/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: AppRoutes.root,
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.root,
        redirect: (context, state) async {
          final isAuthenticated = getIt<AuthBloc>().isAuthenticated();
          if (isAuthenticated) {
            return AppRoutes.home;
          }

          return AppRoutes.signIn;
        },
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => BlocProvider.value(
          value: getIt<AuthBloc>(),
          child: const SignInPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.accountSetUp,
        builder: (context, state) => Container(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => Container(),
      ),
    ],
  );
}
