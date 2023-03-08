import 'package:flutter/material.dart';

class GradientCircle {
  GradientCircle({
    required this.rect,
    required this.gradient,
    this.move = 0,
  });

  final Rect rect;
  final LinearGradient gradient;
  final double move;

  void draw(Canvas canvas) {
    final drawRect = Rect.fromLTWH(
      rect.left,
      rect.top + (move * 100 * 2),
      rect.width,
      rect.height,
    );

    final paint = Paint()
      ..blendMode = BlendMode.overlay
      ..shader = gradient.createShader(drawRect)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        16,
      );

    canvas.drawCircle(drawRect.center, drawRect.width / 2, paint);
  }
}
