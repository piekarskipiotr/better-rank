import 'dart:io';

import 'package:betterrank/config/config.dart';
import 'package:betterrank/data/enum/image_button_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({required this.type, this.image, super.key});

  final ImageButtonType type;
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      borderRadius: const BorderRadius.all(Radius.circular(38)),
      child: Ink(
        width: size.shortestSide,
        height: 190,
        decoration: BoxDecoration(
          color: AppTheme.isDarkMode() ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(38)),
        ),
        child: image != null
            ? FittedBox(
                fit: BoxFit.cover,
                child: Image.file(File(image!.path)),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: AppTheme.isDarkMode() ? Colors.white : Colors.black,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    type.getAddName(context),
                    style: GoogleFonts.inter(
                      color:
                          AppTheme.isDarkMode() ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
