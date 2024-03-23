import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:equatable/equatable.dart';

class CurrentWeatherEntity extends Equatable {
  const CurrentWeatherEntity({
    required this.weather,
    required this.timezone,
    required this.id,
    required this.name,
    required this.dateTimestamp,
    required this.visibility,
    required this.base,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  final List<WeatherEntity> weather;
  final int timezone;
  final int id;
  final String name;
  final int dateTimestamp;
  final double visibility;
  final String base;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double humidity;

  @override
  List<Object?> get props => [
        weather,
        timezone,
        id,
        name,
        dateTimestamp,
        visibility,
        base,
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
      ];
}
