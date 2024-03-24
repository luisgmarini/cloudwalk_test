import 'package:cloudwalk_weather_test/app/modules/weather/data/datasource/weather_datasource.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/data/models/response/fetch_current_weather_response_dto.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/usecases/forecast_next_5days_usecase.dart';
import 'package:cloudwalk_weather_test/core/entity/failures.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/weather_respository.dart';
import '../../domain/usecases/fetch_current_weather_usecase.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required WeatherDatasource dataSource,
  }) : _dataSource = dataSource;

  final WeatherDatasource _dataSource;

  @override
  Future<Either<Failure, WeatherEntity>> fetchCurrentWeather(
    FetchCurrentWeatherUsecaseParams params,
  ) async {
    try {
      final result = await _dataSource.fetchCurrentWeather(
        lat: params.cityEntity.lat,
        lon: params.cityEntity.lon,
      );

      return result.flatMap(
        (a) {
          return Right(
            FetchCurrentWeatherResponseDTO.fromJson(a.data),
          );
        },
      );
    } catch (e) {
      return Left(ParserErrorFailure());
    }
  }

  @override
  Future<Either<Failure, List<WeatherEntity>>> forecastNext5Days(
    ForecastNext5DaysUsecaseParams params,
  ) async {
    try {
      final result = await _dataSource.forecastNext5days(
        lat: params.cityEntity.lat,
        lon: params.cityEntity.lon,
      );

      return result.flatMap(
        (a) {
          return Right(
            List.from(a.data['list'])
                .map((e) => FetchCurrentWeatherResponseDTO.fromJson(e))
                .toList(),
          );
        },
      );
    } catch (e) {
      return Left(ParserErrorFailure());
    }
  }
}
