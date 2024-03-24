import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/repository/weather_respository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/entity/failures.dart';

abstract class FetchCurrentWeatherUsecase {
  Future<Either<Failure, WeatherEntity>> call(
    CityEntity city,
  );
}

class FetchCurrentWeatherUsecaseImpl implements FetchCurrentWeatherUsecase {
  FetchCurrentWeatherUsecaseImpl({
    required WeatherRepository repository,
  }) : _repository = repository;

  final WeatherRepository _repository;

  @override
  Future<Either<Failure, WeatherEntity>> call(
    CityEntity city,
  ) async {
    return await _repository.fetchCurrentWeather(city);
  }
}
