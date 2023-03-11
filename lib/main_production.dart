import 'package:betterrank/app/app.dart';
import 'package:betterrank/bootstrap.dart';
import 'package:betterrank/config/config.dart';
import 'package:betterrank/di/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme.initSystemChromeSettings();
  await Firebase.initializeApp();
  configureDependencies();

  await bootstrap(() => const App());
}
