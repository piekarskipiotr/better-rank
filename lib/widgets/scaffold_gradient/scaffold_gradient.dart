import 'package:betterrank/config/config.dart';
import 'package:betterrank/widgets/scaffold_gradient/circle_gradient.dart';
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
    _scaffold = widget.scaffold;

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
            painter: CircleGradient(_controller.value),
            child: _scaffold,
          );
        },
      ),
    );
  }
}
