import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Hi, friend!\nLet’s better rank it!',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
