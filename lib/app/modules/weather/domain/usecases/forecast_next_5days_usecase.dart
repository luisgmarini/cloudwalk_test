import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/repository/weather_respository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/entity/failures.dart';

abstract class ForecastNext5DaysUsecase {
  Future<Either<Failure, List<WeatherEntity>>> call(
    CityEntity city,
  );
}

class ForecastNext5DaysUsecaseImpl implements ForecastNext5DaysUsecase {
  ForecastNext5DaysUsecaseImpl({
    required WeatherRepository repository,
  }) : _repository = repository;

  final WeatherRepository _repository;

  @override
  Future<Either<Failure, List<WeatherEntity>>> call(CityEntity city) async {
    return _repository.forecastNext5Days(city);
  }
}
