import 'package:cloudwalk_weather_test/app/modules/weather/data/models/response/weather_response_dto.dart';

import '../../../domain/entity/current_weather_entity.dart';

class FetchCurrentWeatherResponseDTO extends CurrentWeatherEntity {
  const FetchCurrentWeatherResponseDTO({
    required super.weather,
    required super.timezone,
    required super.id,
    required super.name,
    required super.dateTimestamp,
    required super.visibility,
    required super.base,
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
  });

  factory FetchCurrentWeatherResponseDTO.fromJson(Map<String, dynamic> json) {
    final mainJsonData = json['main'];
    return FetchCurrentWeatherResponseDTO(
      weather: List.from(json['weather'])
          .map(
            (e) => WeatherResponseDTO.fromJson(e),
          )
          .toList(),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      dateTimestamp: json['dt'],
      visibility: (json['visibility'] as num).toDouble(),
      base: json['base'],
      temp: (mainJsonData['temp'] as num).toDouble(),
      feelsLike: (mainJsonData['feels_like'] as num).toDouble(),
      tempMin: (mainJsonData['temp_min'] as num).toDouble(),
      tempMax: (mainJsonData['temp_max'] as num).toDouble(),
      pressure: (mainJsonData['pressure'] as num).toDouble(),
      humidity: (mainJsonData['humidity'] as num).toDouble(),
    );
  }
}
