import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/entity.dart';

abstract class WeatherDetailsState {}

class WeatherDetailsInitial extends WeatherDetailsState {}

class WeatherDetailsLoading extends WeatherDetailsState {}

class WeatherDetailsError extends WeatherDetailsState {}

class WeatherDetailsLoaded extends WeatherDetailsState {
  final List<WeatherEntity> forecast;

  WeatherDetailsLoaded({
    required this.forecast,
  });
}
