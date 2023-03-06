import 'package:betterrank/config/config.dart';
import 'package:flutter/material.dart';

class ScaffoldGradient extends StatelessWidget {
  const ScaffoldGradient({
    required this.scaffold,
    super.key,
  });

  final Scaffold scaffold;

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
      child: scaffold,
    );
  }
}
