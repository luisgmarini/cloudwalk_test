import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/repository/weather_respository.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/usecases/fetch_current_weather_usecase.dart';
import 'package:cloudwalk_weather_test/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/weather_mocks.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late MockWeatherRepository repository;
  late FetchCurrentWeatherUsecase weatherUsecase;

  setUpAll(
    () {
      repository = MockWeatherRepository();
      weatherUsecase = FetchCurrentWeatherUsecaseImpl(repository: repository);
    },
  );

  test(
    'Should return WeatherEntity on repository callback success',
    () async {
      when(() => repository.fetchCurrentWeather(mockCity))
          .thenAnswer((_) async => Right(mockWeather));

      final result = await weatherUsecase.call(mockCity);

      expect(result.fold((l) => l, (r) => r), isA<WeatherEntity>());
    },
  );

  test(
    'Should return a Failure on repository callback error',
    () async {
      when(() => repository.fetchCurrentWeather(mockCity))
          .thenAnswer((_) async => Left(ParserErrorFailure()));

      final result = await weatherUsecase.call(mockCity);

      expect(result.fold((l) => l, (r) => r), isA<ParserErrorFailure>());
    },
  );
}
