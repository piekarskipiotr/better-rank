import 'package:betterrank/common/helpers/error_translator.dart';
import 'package:betterrank/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SnackBar errorSnackbar({required BuildContext context, required String error}) {
  final errorText = ErrorTranslator.translate(
    context: context,
    error: error,
  );

  return SnackBar(
    backgroundColor: AppColors.red,
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    content: Row(
      children: [
        const Icon(Icons.error_outline_rounded, color: Colors.white),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            errorText,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
