import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../app/modules/home/di/home_injection_container.dart';
import '../../app/modules/weather/di/weather_injection_container.dart';
import '../internet/internet.dart';

class InjectionContainer {
  static final _instance = GetIt.instance;

  static Future<void> initialize() async {
    _instance.registerLazySingleton<Dio>(
      () => CustomDioClient.initialize(),
    );

    _instance.registerLazySingleton<HttpClient>(
      () => HttpClientImpl(
        dioInstance: _instance.get<Dio>(),
      ),
    );

    WeatherInjectionContainer.call(_instance);
    HomeInjectionContainer.call(_instance);
  }
}
