import 'package:betterrank/app/view/app_background/gradient_circles_painter.dart';
import 'package:betterrank/config/config.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatefulWidget {
  const AppBackground({
    required this.app,
    super.key,
  });

  final Widget app;

  @override
  State<AppBackground> createState() => _AppBackgroundState();
}

class _AppBackgroundState extends State<AppBackground>
    with SingleTickerProviderStateMixin {
  late Widget _app;

  late Animation<double> _animation;
  late AnimationController _controller;
  final Tween<double> _rotationTween = Tween(begin: -1, end: 1);

  static const _gradient = LinearGradient(
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
  );

  @override
  void initState() {
    super.initState();
    _app = widget.app;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    _animation = _rotationTween.animate(_controller)
      ..addListener(() => setState(() => {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat(reverse: true);
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: _gradient,
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: GradientCirclesPainter(_controller.value),
            child: _app,
          );
        },
      ),
    );
  }
}
