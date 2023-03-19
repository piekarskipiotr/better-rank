import 'package:betterrank/config/config.dart';
import 'package:betterrank/di/get_it.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_set_up_bloc.dart';
import 'package:betterrank/pages/account_set_up/view/profile_set_up.dart';
import 'package:betterrank/pages/account_set_up/view/profile_set_up_finish.dart';
import 'package:betterrank/pages/permissions_rationale/permission_rationale_page.dart';
import 'package:betterrank/pages/sign_in/bloc/auth_bloc.dart';
import 'package:betterrank/pages/sign_in/view/sign_in_page.dart';
import 'package:betterrank/widgets/loading/bloc/loading_overlay_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class AppRouter {
  GoRouter router({String? initialLocation}) => GoRouter(
        initialLocation: initialLocation ?? AppRoutes.root,
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
            path: AppRoutes.permissionRationale,
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
            builder: (context, state) => BlocProvider.value(
              value: getIt<AuthBloc>(),
              child: const SignInPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.accountSetUp,
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
            builder: (context, state) => const ProfileSetUpFinish(),
          ),
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const Center(
              child: Text('home'),
            ),
          ),
        ],
      );
}
