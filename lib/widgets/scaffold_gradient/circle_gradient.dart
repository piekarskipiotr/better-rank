import 'package:betterrank/config/config.dart';
import 'package:betterrank/data/models/gradient_circle.dart';
import 'package:flutter/material.dart';

class CircleGradient extends CustomPainter {
  CircleGradient(
    this.value,
  );

  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final baseColor = AppTheme.isDarkMode() ? Colors.white : Colors.black;
    final circles = [
      GradientCircle(
        rect: const Rect.fromLTWH(60, 64, 300, 300),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            baseColor,
            AppColors.pink,
          ],
        ),
        move: value,
      ),
      GradientCircle(
        rect: const Rect.fromLTWH(260, 254, 300, 300),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            baseColor,
            AppColors.pinkPurple,
          ],
        ),
        move: value,
      ),
      GradientCircle(
        rect: const Rect.fromLTWH(30, 320, 300, 300),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.pink,
            AppColors.pinkPurple,
          ],
        ),
        move: value,
      ),
    ];

    for (final circle in circles) {
      circle.draw(canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
