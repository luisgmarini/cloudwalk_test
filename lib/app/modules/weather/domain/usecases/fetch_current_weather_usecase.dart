import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/current_weather_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/repository/weather_respository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/entity/failures.dart';

class FetchCurrentWeatherUsecase {
  FetchCurrentWeatherUsecase({
    required WeatherRepository repository,
  }) : _repository = repository;

  final WeatherRepository _repository;

  Future<Either<Failure, CurrentWeatherEntity>> call(
      FetchCurrentWeatherUsecaseParams params) async {
    return _repository.fetchCurrentWeather(params);
  }
}

class FetchCurrentWeatherUsecaseParams {
  const FetchCurrentWeatherUsecaseParams({
    required this.cityEntity,
  });

  final CityEntity cityEntity;
}
