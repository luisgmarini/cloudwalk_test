import 'package:cloudwalk_weather_test/app/modules/weather/data/datasource/weather_datasource.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/data/models/response/fetch_current_weather_response_dto.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/current_weather_entity.dart';
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
  Future<Either<Failure, CurrentWeatherEntity>> fetchCurrentWeather(
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
            FetchCurrentWeatherResponseDTO.fromJson(a.data!),
          );
        },
      );
    } catch (e) {
      print(e);
      return Left(ParserErrorFailure());
    }
  }
}
