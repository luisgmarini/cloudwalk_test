import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/current_weather_entity.dart';
import 'package:cloudwalk_weather_test/core/entity/failures.dart';
import 'package:dartz/dartz.dart';

import '../usecases/fetch_current_weather_usecase.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, CurrentWeatherEntity>> fetchCurrentWeather(
    FetchCurrentWeatherUsecaseParams params,
  );
}
