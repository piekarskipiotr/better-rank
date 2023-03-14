import 'dart:io';
import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios_new,
      ),
    );
  }
}
