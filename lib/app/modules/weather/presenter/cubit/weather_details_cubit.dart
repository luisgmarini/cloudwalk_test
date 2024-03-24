import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/forecast_next_5days_usecase.dart';
import 'weather_details_state.dart';

class WeatherDetailsCubit extends Cubit<WeatherDetailsState> {
  WeatherDetailsCubit({
    required ForecastNext5DaysUsecase forecastNext5DaysUsecase,
  })  : _forecastNext5DaysUsecase = forecastNext5DaysUsecase,
        super(WeatherDetailsInitial());

  final ForecastNext5DaysUsecase _forecastNext5DaysUsecase;

  Future<void> forecastNext5Days(
    CityEntity cityEntity,
  ) async {
    emit(WeatherDetailsLoading());

    final result = await _forecastNext5DaysUsecase(cityEntity);

    return result.fold(
      (l) => emit(WeatherDetailsError()),
      (forecast) => emit(
        WeatherDetailsLoaded(forecast: forecast),
      ),
    );
  }
}
