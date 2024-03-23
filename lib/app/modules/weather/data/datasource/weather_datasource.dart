import 'package:cloudwalk_weather_test/core/entity/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/entity/success.dart';

abstract interface class WeatherDatasource {
  Future<Either<Failure, DataSuccess<Map<String, dynamic>>>>
      fetchCurrentWeather({
    required double lat,
    required double lon,
  });

  Future<Either<Failure, DataSuccess<Map<String, dynamic>>>> forecastNext5days({
    required double lat,
    required double lon,
  });
}
