import 'package:cloudwalk_weather_test/core/constants/api/api_const.dart';
import 'package:cloudwalk_weather_test/core/enviroment/enviroment.dart';

class WeatherUrls {
  WeatherUrls._();

  static String fetchCurrentWeather(
          {required double lat, required double lon}) =>
      '${APIConst.weatherBaseUrl}/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=${Environment.instance?.apiKey}';

  static String get forecastNext5days =>
      '${APIConst.weatherBaseUrl}/data/2.5/forecast&appid=${Environment.instance?.apiKey}';
}
