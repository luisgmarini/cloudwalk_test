import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeEmpty extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeError extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  HomeLoaded({
    required this.currentWeatherEntity,
    required this.cityEntity,
  });

  final WeatherEntity currentWeatherEntity;
  final CityEntity cityEntity;

  @override
  List<Object?> get props => [];
}
