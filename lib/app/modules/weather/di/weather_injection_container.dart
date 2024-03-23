import 'package:cloudwalk_weather_test/app/modules/weather/data/datasource/weather_datasource.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/data/datasource/weather_datasource_impl.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/data/repository/weather_repository_impl.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/repository/weather_respository.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/usecases/fetch_current_weather_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/internet/internet.dart';

class WeatherInjectionContainer {
  WeatherInjectionContainer._();

  static void call(GetIt instance) {
    instance.registerLazySingleton<WeatherDatasource>(
      () => WeatherDatasourceImpl(
        httpClient: instance.get<HttpClient>(),
      ),
    );

    instance.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(
        dataSource: instance.get<WeatherDatasource>(),
      ),
    );

    instance.registerLazySingleton<FetchCurrentWeatherUsecase>(
      () => FetchCurrentWeatherUsecase(
        repository: instance.get<WeatherRepository>(),
      ),
    );
  }
}
