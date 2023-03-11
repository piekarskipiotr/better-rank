import 'package:betterrank/data/enum/sign_in_method.dart';
import 'package:betterrank/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.signInMethod,
    required this.onPressed,
    super.key,
  });

  final SignInMethod signInMethod;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              signInMethod.logo,
              width: 24,
              height: 24,
              colorFilter: signInMethod.logoColorFilter,
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              l10n.sign_in_with(signInMethod.name),
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
