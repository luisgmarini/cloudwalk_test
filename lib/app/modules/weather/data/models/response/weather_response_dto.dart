import '../../../domain/entity/weather_entity.dart';

class WeatherResponseDTO extends WeatherEntity {
  const WeatherResponseDTO({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });

  factory WeatherResponseDTO.fromJson(Map<String, dynamic> json) {
    return WeatherResponseDTO(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: _getIconUrl(json['icon'] ?? ''),
    );
  }

  static String _getIconUrl(String? iconId) {
    return 'https://openweathermap.org/img/wn/$iconId@2x.png';
  }
}
