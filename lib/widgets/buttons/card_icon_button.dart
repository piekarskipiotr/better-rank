import 'package:betterrank/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardIconButton extends StatelessWidget {
  const CardIconButton({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    super.key,
  });

  final String icon;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bgColor = AppTheme.isDarkMode() ? Colors.black : Colors.white;
    final textColor = AppTheme.isDarkMode() ? Colors.white : Colors.black;

    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all(bgColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Row(
          children: [
            Text(
              icon,
              style: TextStyle(
                fontSize: 48,
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Opacity(
                    opacity: 0.9,
                    child: Text(
                      '$subTitle\n\n',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
