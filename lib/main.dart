import 'package:cloudwalk_weather_test/core/di/injection_container.dart';
import 'package:cloudwalk_weather_test/core/enviroment/enviroment.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InjectionContainer.initialize();

  Environment.initialize(
    apiKey: '', // Add here your Weather API key
  );

  runApp(const App());
}
