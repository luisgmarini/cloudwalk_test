import '../../../domain/entity/weather_info_entity.dart';

class WeatherInfoResponseDTO extends WeatherInfoEntity {
  const WeatherInfoResponseDTO({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });

  factory WeatherInfoResponseDTO.fromJson(Map<String, dynamic> json) {
    return WeatherInfoResponseDTO(
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
