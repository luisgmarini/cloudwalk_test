import 'package:cloudwalk_weather_test/core/enviroment/enviroment.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.initialize(apiKey: ''); // Add here Weather API key

  runApp(const App());
}
