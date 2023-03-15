import 'package:betterrank/config/config.dart';
import 'package:betterrank/di/get_it.dart';
import 'package:betterrank/pages/sign_in/bloc/auth_bloc.dart';
import 'package:betterrank/pages/sign_in/view/sign_in_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    configureDependencies();
  });

  group('Router', () {
    testWidgets('renders SignInPage via router', (widgetTester) async {
      final authBloc = MockAuthBloc();

      await widgetTester.pumpRouterApp(
        AppRoutes.signIn,
        (child) => BlocProvider.value(
          value: authBloc,
          child: const SignInPage(),
        ),
      );

      expect(find.byType(SignInPage), findsOneWidget);
    });
  });
}
