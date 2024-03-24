import 'package:bloc_test/bloc_test.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/cubit/home_state.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/usecases/fetch_current_weather_usecase.dart';
import 'package:cloudwalk_weather_test/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../weather/mocks/weather_mocks.dart';

class MockFetchCurrentWeatherUsecase extends Mock
    implements FetchCurrentWeatherUsecase {}

void main() {
  late MockFetchCurrentWeatherUsecase mockUsecase;
  late HomeCubit cubit;

  setUpAll(
    () {
      mockUsecase = MockFetchCurrentWeatherUsecase();
      cubit = HomeCubit(fetchCurrentWeatherUsecase: mockUsecase);
    },
  );

  test(
    'Should have initial state as [HomeInitial]',
    () {
      expect(cubit.state, isA<HomeInitial>());
    },
  );

  group('Fetch current weather test', () {
    blocTest(
      'Should emit [HomeLoading, HomeLoaded] when get weather',
      build: () {
        when(() => mockUsecase.call(mockCity))
            .thenAnswer((_) async => Right(mockWeather));

        return HomeCubit(fetchCurrentWeatherUsecase: mockUsecase);
      },
      act: (HomeCubit cubit) => cubit.fetchCurrentWeather(mockCity),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeLoaded>(),
      ],
    );

    blocTest(
      'Should emit [HomeLoading, HomeError] when fail to get weather',
      build: () {
        when(() => mockUsecase.call(mockCity))
            .thenAnswer((_) async => Left(ParserErrorFailure()));

        return HomeCubit(fetchCurrentWeatherUsecase: mockUsecase);
      },
      act: (HomeCubit cubit) => cubit.fetchCurrentWeather(mockCity),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeError>(),
      ],
    );
  });
}
