import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/usecases/fetch_current_weather_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required FetchCurrentWeatherUsecase fetchCurrentWeatherUsecase,
  })  : _fetchCurrentWeatherUsecase = fetchCurrentWeatherUsecase,
        super(HomeInitial());

  final FetchCurrentWeatherUsecase _fetchCurrentWeatherUsecase;

  Future<void> fetchCurrentWeather(CityEntity cityEntity) async {
    emit(HomeLoading());

    final result = await _fetchCurrentWeatherUsecase(cityEntity);

    return result.fold(
      (l) => emit(HomeError()),
      (currentWeatherEntity) => emit(
        HomeLoaded(
          currentWeatherEntity: currentWeatherEntity,
          cityEntity: cityEntity,
        ),
      ),
    );
  }
}
