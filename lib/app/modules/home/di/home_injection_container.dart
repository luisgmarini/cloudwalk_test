import 'package:cloudwalk_weather_test/app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../weather/domain/usecases/fetch_current_weather_usecase.dart';

class HomeInjectionContainer {
  HomeInjectionContainer._();

  static void call(GetIt instance) {
    instance.registerFactory<HomeCubit>(
      () => HomeCubit(
        fetchCurrentWeatherUsecase: instance.get<FetchCurrentWeatherUsecase>(),
      ),
    );
  }
}
