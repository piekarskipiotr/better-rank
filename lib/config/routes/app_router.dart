import 'package:betterrank/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.root,
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.root,
        builder: (context, state) => Container(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
