import 'package:betterrank/config/config.dart';
import 'package:betterrank/di/get_it.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_set_up_bloc.dart';
import 'package:betterrank/pages/account_set_up/view/profile_set_up.dart';
import 'package:betterrank/pages/account_set_up/view/profile_set_up_finish.dart';
import 'package:betterrank/pages/main_page/view/main_page.dart';
import 'package:betterrank/pages/permissions_rationale/permission_rationale_page.dart';
import 'package:betterrank/pages/sign_in/bloc/auth_bloc.dart';
import 'package:betterrank/pages/sign_in/view/sign_in_page.dart';
import 'package:betterrank/widgets/loading/bloc/loading_overlay_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class AppRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter router({String? initialLocation}) => GoRouter(
        initialLocation: initialLocation ?? AppRoutes.root,
        navigatorKey: _rootNavigatorKey,
        routes: [
          GoRoute(
            path: AppRoutes.root,
            parentNavigatorKey: _rootNavigatorKey,
            redirect: (context, state) async {
              final isAuthenticated = getIt<AuthBloc>().isAuthenticated();
              if (isAuthenticated) {
                return AppRoutes.trending;
              }

              return AppRoutes.signIn;
            },
          ),
          GoRoute(
            path: AppRoutes.permissionRationale,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) {
              final perm = state.extra! as Permission;

              return CustomTransitionPage<void>(
                key: state.pageKey,
                child: PermissionRationalePage(permission: perm),
                transitionsBuilder: (context, anim, secondaryAnim, child) =>
                    FadeTransition(opacity: anim, child: child),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.signIn,
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => BlocProvider.value(
              value: getIt<AuthBloc>(),
              child: const SignInPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.accountSetUp,
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: getIt<ProfileSetUpBloc>()),
                BlocProvider.value(value: getIt<LoadingOverlayCubit>()),
              ],
              child: const ProfileSetUp(),
            ),
          ),
          GoRoute(
            path: AppRoutes.accountSetUpFinish,
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => const ProfileSetUpFinish(),
          ),
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              if (kDebugMode) {
                print(state.location);
              }

              return MainPage(child: child);
            },
            routes: [
              GoRoute(
                path: AppRoutes.trending,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Center(child: Text('Trending')),
                ),
              ),
              GoRoute(
                path: AppRoutes.search,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Center(child: Text('Search')),
                ),
              ),
              GoRoute(
                path: AppRoutes.create,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Center(child: Text('Create')),
                ),
              ),
              GoRoute(
                path: AppRoutes.notifications,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Center(child: Text('Notifications')),
                ),
              ),
              GoRoute(
                path: AppRoutes.profile,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Center(child: Text('Profile')),
                ),
              ),
            ],
          ),
        ],
      );
}
