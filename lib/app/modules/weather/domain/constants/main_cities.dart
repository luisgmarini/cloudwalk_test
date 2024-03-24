import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';

class MainCities {
  static List<CityEntity> get list => const [
        CityEntity(
          name: 'Silverstone, UK',
          lat: 52.091660,
          lon: -1.026140,
        ),
        CityEntity(
          name: 'São Paulo, Brazil',
          lat: -23.550520,
          lon: -46.633308,
        ),
        CityEntity(
          name: 'Melbourne, Australia',
          lat: -37.813629,
          lon: 144.963058,
        ),
        CityEntity(
          name: 'Monte Carlo, Monaco',
          lat: 43.740421,
          lon: 7.425580,
        ),
      ];
}
