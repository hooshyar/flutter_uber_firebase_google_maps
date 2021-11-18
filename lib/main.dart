import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  await FlutterConfig?.loadEnvVariables();
  await Firebase.initializeApp();
  runApp(MyApp(settingsController: settingsController));
}
