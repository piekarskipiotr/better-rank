import 'package:betterrank/config/config.dart';
import 'package:betterrank/data/models/gradient_circle.dart';
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

  // animations
  late Animation<double> animation;
  late AnimationController controller;
  final Tween<double> _rotationTween = Tween(begin: -1, end: 1);

  @override
  void initState() {
    super.initState();
    _scaffold = widget.scaffold;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat(reverse: true);
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
    GradientCircle(
      rect: const Rect.fromLTWH(60, 64, 300, 300),
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white,
          AppColors.pink,
        ],
      ),
      move: value,
    ).draw(canvas);

    GradientCircle(
      rect: const Rect.fromLTWH(260, 254, 300, 300),
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white,
          AppColors.pinkPurple,
        ],
      ),
      move: value,
    ).draw(canvas);

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
    ).draw(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
