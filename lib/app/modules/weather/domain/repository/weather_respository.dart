import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:cloudwalk_weather_test/core/entity/failures.dart';
import 'package:dartz/dartz.dart';

import '../usecases/fetch_current_weather_usecase.dart';
import '../usecases/forecast_next_5days_usecase.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> fetchCurrentWeather(
    FetchCurrentWeatherUsecaseParams params,
  );

  Future<Either<Failure, List<WeatherEntity>>> forecastNext5Days(
    ForecastNext5DaysUsecaseParams params,
  );
}
