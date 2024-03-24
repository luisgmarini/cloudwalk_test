import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:cloudwalk_weather_test/core/entity/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> fetchCurrentWeather(
    CityEntity city,
  );

  Future<Either<Failure, List<WeatherEntity>>> forecastNext5Days(
    CityEntity city,
  );
}
