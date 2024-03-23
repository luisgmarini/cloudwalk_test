import 'package:cloudwalk_weather_test/core/di/injection_container.dart';
import 'package:cloudwalk_weather_test/core/enviroment/enviroment.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InjectionContainer.initialize();

  Environment.initialize(
      apiKey: 'a8be747b18e9d6325ff9c4cabed06b94'); // Add here Weather API key

  runApp(const App());
}
