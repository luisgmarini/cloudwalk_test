import 'package:cloudwalk_weather_test/app/modules/weather/data/datasource/weather_datasource.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/data/weather_urls.dart';
import 'package:cloudwalk_weather_test/core/entity/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/entity/success.dart';
import '../../../../../core/internet/exceptions/http_exception.dart';
import '../../../../../core/internet/internet.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  WeatherDatasourceImpl({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  final HttpClient _httpClient;

  @override
  Future<Either<Failure, DataSuccess<Map<String, dynamic>>>>
      fetchCurrentWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      final result = await _httpClient.doRequest<Map<String, dynamic>>(
        HttpRequest(
          path: WeatherUrls.fetchCurrentWeather(
            lat: lat,
            lon: lon,
          ),
          method: 'GET',
        ),
      );

      return Right(
        DataSuccess(
          data: result.data ?? {},
        ),
      );
    } catch (e) {
      return Left(_mapperError(e));
    }
  }

  @override
  Future<Either<Failure, DataSuccess<Map<String, dynamic>>>> forecastNext5days({
    required double lat,
    required double lon,
  }) async {
    try {
      final result = await _httpClient.doRequest<Map<String, dynamic>>(
        HttpRequest(
          path: WeatherUrls.forecastNext5days(lon: lon, lat: lat),
          method: 'GET',
        ),
      );

      return Right(
        DataSuccess(
          data: result.data ?? {},
        ),
      );
    } catch (e) {
      return Left(_mapperError(e));
    }
  }
}

Failure _mapperError(result) {
  if (result is UnauthorizedException) {
    return UnAuthorizedFailure();
  }

  if (result is NotFoundException) {
    return NotFoundFailure();
  }

  if (result is BadRequestException) {
    return InvalidParamsFailure(
      errors: result.error,
    );
  }

  return ServerErrorFailure();
}
