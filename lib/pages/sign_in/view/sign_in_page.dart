import 'package:betterrank/data/enum/sign_in_method.dart';
import 'package:betterrank/l10n/l10n.dart';
import 'package:betterrank/pages/sign_in/bloc/auth_bloc.dart';
import 'package:betterrank/widgets/buttons/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocConsumer(
      bloc: context.read<AuthBloc>(),
      listener: (context, state) {

      },
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.sign_in_page_header,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(height: 56),
                    _signInButtons(context),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Align(
                child: Text(
                  l10n.or,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              _continueAsAnonymousButton(context),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButtons(BuildContext context) {
    return Column(
      children: [
        SignInButton(
          signInMethod: SignInMethod.google,
          onPressed: () => context.read<AuthBloc>().add(SigningInWithGoogle()),
        ),
        const SizedBox(height: 16),
        SignInButton(
          signInMethod: SignInMethod.apple,
          onPressed: () => context.read<AuthBloc>().add(SigningInWithApple()),
        ),
      ],
    );
  }

  Widget _continueAsAnonymousButton(BuildContext context) {
    final l10n = context.l10n;

    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          l10n.continue_as_anon,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
