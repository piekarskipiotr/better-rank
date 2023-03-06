import 'package:betterrank/config/config.dart';
import 'package:betterrank/widgets/scaffold_gradient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.root,
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.root,
        builder: (context, state) => const ScaffoldGradient(
          scaffold: Scaffold(
            body: Center(
              child: Text(
                'BetterRank Rocks 🔥',
              ),
            ),
          ),
        ),
      ),
    ],
  );

  static GoRouter get router => _router;
}
