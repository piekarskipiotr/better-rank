import 'package:betterrank/config/config.dart';
import 'package:flutter/material.dart';

class ScaffoldGradient extends StatefulWidget {
  const ScaffoldGradient({
    required this.scaffold,
    super.key,
  });

  final Scaffold scaffold;

  @override
  State<ScaffoldGradient> createState() => _ScaffoldGradientState();
}

class _ScaffoldGradientState extends State<ScaffoldGradient>
    with SingleTickerProviderStateMixin {

  late Scaffold _scaffold;
  late Animation<double> animation;
  late AnimationController controller;
  final Tween<double> _rotationTween = Tween(begin: -1, end: 1);

  @override
  void initState() {
    super.initState();
    _scaffold = widget.scaffold;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.primaryBlue,
            AppColors.primaryBlue,
            AppColors.primaryBlue,
            AppColors.pinkPurple,
            AppColors.purple,
            AppColors.purple,
          ],
        ),
      ),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return CustomPaint(
            painter: CirclePainter(controller.value),
            child: _scaffold,
          );
        },
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter(this.value);

  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final convertedValue = value * 100;
    final r1 = 254 + convertedValue;
    final r2 = 420 + convertedValue;
    final r3 = 480 + convertedValue;
    final rect = Rect.fromLTWH(60, r1, 300, 300);
    final rect2 = Rect.fromLTWH(260, r2, 300, 300);
    final rect3 = Rect.fromLTWH(90, r3, 300, 300);

    _drawCircle(
      canvas,
      rect,
      const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white,
          AppColors.pink,
        ],
      ),
    );

    _drawCircle(
      canvas,
      rect2,
      const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white,
          AppColors.pinkPurple,
        ],
      ),
    );

    _drawCircle(
      canvas,
      rect3,
      const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          AppColors.pink,
          AppColors.pinkPurple,
        ],
      ),
    );
  }

  void _drawCircle(Canvas canvas, Rect rect, LinearGradient gradient) {
    final paint = Paint()
      ..blendMode = BlendMode.overlay
      ..shader = gradient.createShader(rect)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        16,
      );

    canvas.drawCircle(rect.center, rect.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
