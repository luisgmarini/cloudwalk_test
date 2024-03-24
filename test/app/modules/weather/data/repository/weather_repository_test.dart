import 'package:cloudwalk_weather_test/app/modules/weather/data/datasource/weather_datasource.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/data/repository/weather_repository_impl.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/repository/weather_respository.dart';
import 'package:cloudwalk_weather_test/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/weather_mocks.dart';

class MockWeatherDatasource extends Mock implements WeatherDatasource {}

void main() {
  late MockWeatherDatasource datasource;
  late WeatherRepository repository;

  setUpAll(
    () {
      datasource = MockWeatherDatasource();
      repository = WeatherRepositoryImpl(dataSource: datasource);
    },
  );

  group(
    'Fetch current weather test',
    () {
      test(
        'Should get current weather',
        () async {
          when(() => datasource.fetchCurrentWeather(lat: 0, lon: 0)).thenAnswer(
              (_) async => Right(DataSuccess(data: currentWeatherJsonMock)));

          final result = await repository.fetchCurrentWeather(mockCity);

          expect(result, isA<Right>());
        },
      );

      test(
        'Should return Left on datasource callback error',
        () async {
          when(() => datasource.fetchCurrentWeather(lon: 0, lat: 0))
              .thenAnswer((_) async => Left(ServerErrorFailure()));

          final result = await repository.fetchCurrentWeather(mockCity);

          expect(result, isA<Left>());
        },
      );
    },
  );

  group(
    'Forecast weather test',
    () {
      test(
        'Should get forecast weather',
        () async {
          when(() => datasource.forecastNext5days(lat: 0, lon: 0)).thenAnswer(
              (_) async => Right(DataSuccess(data: forecastWeatherJsonMock)));

          final result = await repository.forecastNext5Days(mockCity);

          expect(result, isA<Right>());
        },
      );

      test(
        'Should return Left on datasource callback error',
        () async {
          when(() => datasource.forecastNext5days(lon: 0, lat: 0))
              .thenAnswer((_) async => Left(ServerErrorFailure()));

          final result = await repository.forecastNext5Days(mockCity);

          expect(result, isA<Left>());
        },
      );
    },
  );
}
