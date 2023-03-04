import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const root = '/';

  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: root, builder: (context, state) => Container()),
    ],
  );

  static GoRouter get router => _router;
}
