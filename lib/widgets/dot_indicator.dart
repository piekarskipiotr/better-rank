import 'package:betterrank/config/config.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final dotsColors = AppTheme.isDarkMode() ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: isActive ? dotsColors : dotsColors.withOpacity(0.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
      ),
    );
  }
}
