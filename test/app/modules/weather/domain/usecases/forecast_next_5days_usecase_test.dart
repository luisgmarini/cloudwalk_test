import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/usecases/forecast_next_5days_usecase.dart';
import 'package:cloudwalk_weather_test/core/entity/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/weather_mocks.dart';
import 'fetch_current_weather_usecase_test.dart';

void main() {
  late MockWeatherRepository repository;
  late ForecastNext5DaysUsecase usecase;

  setUpAll(
    () {
      repository = MockWeatherRepository();
      usecase = ForecastNext5DaysUsecaseImpl(repository: repository);
    },
  );

  test(
    'Should return a list of WeatherEntity on repository callback success',
    () async {
      when(() => repository.forecastNext5Days(mockCity))
          .thenAnswer((_) async => Right([mockWeather]));

      final result = await usecase.call(mockCity);

      expect(result.fold((l) => l, (r) => r), isA<List<WeatherEntity>>());
    },
  );

  test(
    'Should return a Failure on repository callback error',
    () async {
      when(() => repository.forecastNext5Days(mockCity))
          .thenAnswer((_) async => Left(ParserErrorFailure()));

      final result = await usecase.call(mockCity);

      expect(result.fold((l) => l, (r) => r), isA<ParserErrorFailure>());
    },
  );
}
