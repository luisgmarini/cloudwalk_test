import 'package:cloudwalk_weather_test/app/modules/weather/data/models/response/weather_info_response_dto.dart';

import '../../../domain/entity/weather_entity.dart';

class FetchCurrentWeatherResponseDTO extends WeatherEntity {
  const FetchCurrentWeatherResponseDTO({
    required super.weatherInfo,
    required super.visibility,
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
    super.date,
  });

  factory FetchCurrentWeatherResponseDTO.fromJson(Map<String, dynamic> json) {
    final mainJsonData = json['main'];
    return FetchCurrentWeatherResponseDTO(
      weatherInfo: List.from(json['weather'])
          .map(
            (e) => WeatherInfoResponseDTO.fromJson(e),
          )
          .toList(),
      visibility: (json['visibility'] as num).toDouble(),
      temp: (mainJsonData['temp'] as num).toDouble(),
      feelsLike: (mainJsonData['feels_like'] as num).toDouble(),
      tempMin: (mainJsonData['temp_min'] as num).toDouble(),
      tempMax: (mainJsonData['temp_max'] as num).toDouble(),
      pressure: (mainJsonData['pressure'] as num).toDouble(),
      humidity: (mainJsonData['humidity'] as num).toDouble(),
      date: json['dt_txt'],
    );
  }
}
