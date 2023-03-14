import 'package:betterrank/config/config.dart';
import 'package:betterrank/di/get_it.dart';
import 'package:betterrank/pages/account_set_up/view/profile_set_up.dart';
import 'package:betterrank/pages/sign_in/bloc/auth_bloc.dart';
import 'package:betterrank/pages/sign_in/view/sign_in_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            path: AppRoutes.signIn,
            builder: (context, state) => BlocProvider.value(
              value: getIt<AuthBloc>(),
              child: const SignInPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.accountSetUp,
            builder: (context, state) => const ProfileSetUp(),
          ),
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const ProfileSetUp(),
          ),
        ],
      );
}
