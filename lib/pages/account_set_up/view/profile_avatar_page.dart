import 'dart:io';

import 'package:betterrank/config/config.dart';
import 'package:betterrank/l10n/l10n.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_avatar_cubit.dart';
import 'package:betterrank/widgets/buttons/card_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatarPage extends StatelessWidget {
  const ProfileAvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final avatar = context.watch<ProfileAvatarCubit>().avatar;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            l10n.profile_avatar_header,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.profile_avatar_header_sub,
            textAlign: TextAlign.left,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: (AppTheme.isDarkMode() ? Colors.white : Colors.black)
                  .withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 32),
          if (avatar != null) ...[
            Center(
              child: CircleAvatar(
                radius: 96,
                backgroundColor: Colors.transparent,
                backgroundImage: FileImage(
                  File(avatar.path),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => context.read<ProfileAvatarCubit>().changeAvatar(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.edit,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(l10n.change_image)
                ],
              ),
            )
          ] else ...[
            CardIconButton(
              icon: '📷',
              title: l10n.take_a_selfie,
              subTitle: l10n.take_a_selfie_desc,
              onPressed: () => context
                  .read<ProfileAvatarCubit>()
                  .pickImage(source: ImageSource.camera),
            ),
            const SizedBox(height: 24),
            CardIconButton(
              icon: '🗂️',
              title: l10n.upload_image_avatar,
              subTitle: l10n.upload_image_avatar_desc,
              onPressed: () => context
                  .read<ProfileAvatarCubit>()
                  .pickImage(source: ImageSource.gallery),
            ),
          ],
        ],
      ),
    );
  }
}
