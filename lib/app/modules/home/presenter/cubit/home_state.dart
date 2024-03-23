import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/current_weather_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeEmpty extends HomeState {}

class HomeError extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded({
    required this.currentWeatherEntity,
    required this.cityEntity,
  });

  final CurrentWeatherEntity currentWeatherEntity;
  final CityEntity cityEntity;
}
