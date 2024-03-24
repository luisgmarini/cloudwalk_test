import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/weather_info_entity.dart';
import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.weatherInfo,
    required this.visibility,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.date,
  });

  final List<WeatherInfoEntity> weatherInfo;
  final double visibility;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double humidity;
  final String? date;

  @override
  List<Object?> get props => [
        weatherInfo,
        visibility,
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        date,
      ];
}
