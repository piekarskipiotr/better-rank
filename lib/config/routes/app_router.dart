import 'package:betterrank/config/config.dart';
import 'package:betterrank/pages/sign_in/view/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: AppRoutes.root,
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.root,
        builder: (context, state) => Scaffold(
          body: Center(
            child: InkWell(
              child: const Text('Better Rank Rocks🔥'),
              onTap: () => context.go(AppRoutes.signIn),
            ),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const SignInPage(),
      ),
    ],
  );
}
