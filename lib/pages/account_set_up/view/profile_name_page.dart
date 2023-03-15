import 'package:betterrank/config/config.dart';
import 'package:betterrank/l10n/l10n.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_name_cubit.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_name_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileNamePage extends StatelessWidget {
  const ProfileNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            l10n.profile_name_header,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.profile_name_header_sub,
            textAlign: TextAlign.left,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: (AppTheme.isDarkMode() ? Colors.white : Colors.black)
                  .withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 32),
          BlocBuilder(
            bloc: context.read<ProfileNameCubit>(),
            builder: (context, state) {
              final isValid = context.read<ProfileNameCubit>().isValid;

              return TextFormField(
                style: GoogleFonts.inter(),
                onChanged: (n) =>
                    context.read<ProfileNameCubit>().validateProfileName(n),
                decoration: InputDecoration(
                  hintText: l10n.profile_name,
                  hintStyle: GoogleFonts.inter(),
                  errorText: (isValid ?? true) ? null : l10n.profile_name_taken,
                  suffixIcon: _suffixValidIndicator(
                    isLoading: state is ValidatingProfileName,
                    isValid: isValid,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _suffixValidIndicator({
    required bool isLoading,
    required bool? isValid,
  }) {
    Icon? icon;

    switch (isValid) {
      case true:
        icon = const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green,
        );
        break;
      case false:
        icon = const Icon(
          Icons.cancel_outlined,
          color: AppColors.red,
        );
        break;
      case null:
        icon = null;
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ],
            )
          : icon,
    );
  }
}
