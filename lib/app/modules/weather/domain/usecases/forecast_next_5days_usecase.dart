import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/repository/weather_respository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/entity/failures.dart';

class ForecastNext5DaysUsecase {
  ForecastNext5DaysUsecase({
    required WeatherRepository repository,
  }) : _repository = repository;

  final WeatherRepository _repository;

  Future<Either<Failure, List<WeatherEntity>>> call(
      ForecastNext5DaysUsecaseParams params) async {
    return _repository.forecastNext5Days(params);
  }
}

class ForecastNext5DaysUsecaseParams {
  const ForecastNext5DaysUsecaseParams({
    required this.cityEntity,
  });

  final CityEntity cityEntity;
}
