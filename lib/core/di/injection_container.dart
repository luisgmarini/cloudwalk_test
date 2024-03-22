import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../internet/internet.dart';

class InjectionContainer {
  final _instance = GetIt.instance;

  Future<void> initialize() async {
    _instance.registerLazySingleton<Dio>(
      () => CustomDioClient.initialize(),
    );

    _instance.registerLazySingleton<HttpClient>(
      () => HttpClientImpl(
        dioInstance: _instance.get<Dio>(),
      ),
    );

    // SharedInjectionContainer().call(_instance);
  }
}
