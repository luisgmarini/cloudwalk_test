import 'package:bloc_test/bloc_test.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/usecases/forecast_next_5days_usecase.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/presenter/cubit/weather_details_cubit.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/presenter/cubit/weather_details_state.dart';
import 'package:cloudwalk_weather_test/core/entity/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/weather_mocks.dart';

class MockForecastNext5DaysUsecase extends Mock
    implements ForecastNext5DaysUsecase {}

void main() {
  late MockForecastNext5DaysUsecase mockUsecase;
  late WeatherDetailsCubit cubit;

  setUpAll(
    () {
      mockUsecase = MockForecastNext5DaysUsecase();
      cubit = WeatherDetailsCubit(forecastNext5DaysUsecase: mockUsecase);
    },
  );

  test(
    'Should have initial state as [HomeInitial]',
    () {
      expect(cubit.state, isA<WeatherDetailsInitial>());
    },
  );

  group('Forecast next 5 days test', () {
    blocTest(
      'Should emit [WeatherDetailsLoading, WeatherDetailsLoaded] when forecast weather',
      build: () {
        when(() => mockUsecase.call(mockCity))
            .thenAnswer((_) async => Right([mockWeather]));

        return WeatherDetailsCubit(forecastNext5DaysUsecase: mockUsecase);
      },
      act: (WeatherDetailsCubit cubit) => cubit.forecastNext5Days(mockCity),
      expect: () => [
        isA<WeatherDetailsLoading>(),
        isA<WeatherDetailsLoaded>(),
      ],
    );

    blocTest(
      'Should emit [WeatherDetailsLoading, WeatherDetailsError] when fail to forecast weather',
      build: () {
        when(() => mockUsecase.call(mockCity))
            .thenAnswer((_) async => Left(ParserErrorFailure()));

        return WeatherDetailsCubit(forecastNext5DaysUsecase: mockUsecase);
      },
      act: (WeatherDetailsCubit cubit) => cubit.forecastNext5Days(mockCity),
      expect: () => [
        isA<WeatherDetailsLoading>(),
        isA<WeatherDetailsError>(),
      ],
    );
  });
}
