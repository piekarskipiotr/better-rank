import 'package:betterrank/app/app.dart';
import 'package:betterrank/bootstrap.dart';
import 'package:betterrank/config/config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme.initSystemChromeSettings();

  await bootstrap(() => const App());
}
