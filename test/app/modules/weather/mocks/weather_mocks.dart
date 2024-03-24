import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/entity.dart';

WeatherEntity mockWeather = const WeatherEntity(
  weatherInfo: [
    WeatherInfoEntity(
      id: 1,
      main: 'main',
      description: 'description',
      icon: 'icon',
    )
  ],
  visibility: 100,
  temp: 10,
  feelsLike: 10,
  tempMin: 10,
  tempMax: 10,
  pressure: 10,
  humidity: 10,
);

CityEntity mockCity = const CityEntity(name: 'City name', lat: 0, lon: 0);

Map<String, dynamic> currentWeatherJsonMock = {
  "coord": {"lon": 144.9631, "lat": -37.8136},
  "weather": [
    {"id": 801, "main": "Clouds", "description": "few clouds", "icon": "02n"}
  ],
  "base": "stations",
  "main": {
    "temp": 13.81,
    "feels_like": 13.36,
    "temp_min": 11.38,
    "temp_max": 16.49,
    "pressure": 1021,
    "humidity": 81
  },
  "visibility": 10000,
  "wind": {"speed": 3.6, "deg": 310},
  "clouds": {"all": 20},
  "dt": 1711305834,
  "sys": {
    "type": 2,
    "id": 2080970,
    "country": "AU",
    "sunrise": 1711312051,
    "sunset": 1711355076
  },
  "timezone": 39600,
  "id": 2158177,
  "name": "Melbourne",
  "cod": 200
};

Map<String, dynamic> forecastWeatherJsonMock = {
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1711314000,
      "main": {
        "temp": 13.37,
        "feels_like": 12.85,
        "temp_min": 12.94,
        "temp_max": 13.37,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1017,
        "humidity": 80,
        "temp_kf": 0.43
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {"all": 14},
      "wind": {"speed": 2.5, "deg": 321, "gust": 5.05},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-24 21:00:00"
    },
    {
      "dt": 1711324800,
      "main": {
        "temp": 16.23,
        "feels_like": 15.61,
        "temp_min": 16.23,
        "temp_max": 17.55,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1017,
        "humidity": 65,
        "temp_kf": -1.32
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 7},
      "wind": {"speed": 3.29, "deg": 265, "gust": 5.47},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-25 00:00:00"
    },
    {
      "dt": 1711335600,
      "main": {
        "temp": 22.35,
        "feels_like": 21.68,
        "temp_min": 22.35,
        "temp_max": 22.35,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1015,
        "humidity": 40,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 2.83, "deg": 234, "gust": 5.39},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-25 03:00:00"
    },
    {
      "dt": 1711346400,
      "main": {
        "temp": 23.26,
        "feels_like": 22.69,
        "temp_min": 23.26,
        "temp_max": 23.26,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1013,
        "humidity": 40,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 4.33, "deg": 190, "gust": 5.69},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-25 06:00:00"
    },
    {
      "dt": 1711357200,
      "main": {
        "temp": 18.06,
        "feels_like": 17.64,
        "temp_min": 18.06,
        "temp_max": 18.06,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1015,
        "humidity": 66,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 4.17, "deg": 167, "gust": 6.25},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-25 09:00:00"
    },
    {
      "dt": 1711368000,
      "main": {
        "temp": 16.4,
        "feels_like": 16,
        "temp_min": 16.4,
        "temp_max": 16.4,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1017,
        "humidity": 73,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 2.25, "deg": 158, "gust": 4.4},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-25 12:00:00"
    },
    {
      "dt": 1711378800,
      "main": {
        "temp": 15.02,
        "feels_like": 14.61,
        "temp_min": 15.02,
        "temp_max": 15.02,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1017,
        "humidity": 78,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 1},
      "wind": {"speed": 1.38, "deg": 254, "gust": 3.18},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-25 15:00:00"
    },
    {
      "dt": 1711389600,
      "main": {
        "temp": 13.83,
        "feels_like": 13.41,
        "temp_min": 13.83,
        "temp_max": 13.83,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1017,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 3},
      "wind": {"speed": 1.61, "deg": 279, "gust": 2.56},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-25 18:00:00"
    },
    {
      "dt": 1711400400,
      "main": {
        "temp": 13.24,
        "feels_like": 12.76,
        "temp_min": 13.24,
        "temp_max": 13.24,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1018,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 4},
      "wind": {"speed": 1.78, "deg": 285, "gust": 2.8},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-25 21:00:00"
    },
    {
      "dt": 1711411200,
      "main": {
        "temp": 17.05,
        "feels_like": 16.38,
        "temp_min": 17.05,
        "temp_max": 17.05,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1019,
        "humidity": 60,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {"all": 19},
      "wind": {"speed": 2.6, "deg": 240, "gust": 3.73},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-26 00:00:00"
    },
    {
      "dt": 1711422000,
      "main": {
        "temp": 19.99,
        "feels_like": 19.25,
        "temp_min": 19.99,
        "temp_max": 19.99,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1018,
        "humidity": 46,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {"all": 35},
      "wind": {"speed": 2.82, "deg": 186, "gust": 3.82},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-26 03:00:00"
    },
    {
      "dt": 1711432800,
      "main": {
        "temp": 20,
        "feels_like": 19.33,
        "temp_min": 20,
        "temp_max": 20,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1017,
        "humidity": 49,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {"all": 18},
      "wind": {"speed": 4.9, "deg": 180, "gust": 4.58},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-26 06:00:00"
    },
    {
      "dt": 1711443600,
      "main": {
        "temp": 17.34,
        "feels_like": 16.77,
        "temp_min": 17.34,
        "temp_max": 17.34,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1019,
        "humidity": 63,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 4.22, "deg": 182, "gust": 6.41},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-26 09:00:00"
    },
    {
      "dt": 1711454400,
      "main": {
        "temp": 16.11,
        "feels_like": 15.53,
        "temp_min": 16.11,
        "temp_max": 16.11,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1021,
        "humidity": 67,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 3},
      "wind": {"speed": 2.93, "deg": 169, "gust": 5.65},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-26 12:00:00"
    },
    {
      "dt": 1711465200,
      "main": {
        "temp": 14.88,
        "feels_like": 14.3,
        "temp_min": 14.88,
        "temp_max": 14.88,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1021,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 55},
      "wind": {"speed": 1.24, "deg": 167, "gust": 3.1},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-26 15:00:00"
    },
    {
      "dt": 1711476000,
      "main": {
        "temp": 14.24,
        "feels_like": 13.65,
        "temp_min": 14.24,
        "temp_max": 14.24,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1021,
        "humidity": 74,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 61},
      "wind": {"speed": 1.17, "deg": 224, "gust": 2.42},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-26 18:00:00"
    },
    {
      "dt": 1711486800,
      "main": {
        "temp": 14.67,
        "feels_like": 13.99,
        "temp_min": 14.67,
        "temp_max": 14.67,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1021,
        "humidity": 69,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 78},
      "wind": {"speed": 1.99, "deg": 230, "gust": 3.04},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-26 21:00:00"
    },
    {
      "dt": 1711497600,
      "main": {
        "temp": 18,
        "feels_like": 17.27,
        "temp_min": 18,
        "temp_max": 18,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1022,
        "humidity": 54,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 69},
      "wind": {"speed": 3.22, "deg": 207, "gust": 4.02},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-27 00:00:00"
    },
    {
      "dt": 1711508400,
      "main": {
        "temp": 19.95,
        "feels_like": 19.33,
        "temp_min": 19.95,
        "temp_max": 19.95,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1021,
        "humidity": 51,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 1},
      "wind": {"speed": 4.9, "deg": 204, "gust": 5.16},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-27 03:00:00"
    },
    {
      "dt": 1711519200,
      "main": {
        "temp": 19.17,
        "feels_like": 18.66,
        "temp_min": 19.17,
        "temp_max": 19.17,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1021,
        "humidity": 58,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 10},
      "wind": {"speed": 5.32, "deg": 194, "gust": 6.04},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-27 06:00:00"
    },
    {
      "dt": 1711530000,
      "main": {
        "temp": 17.16,
        "feels_like": 16.73,
        "temp_min": 17.16,
        "temp_max": 17.16,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1022,
        "humidity": 69,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 4},
      "wind": {"speed": 4.66, "deg": 184, "gust": 6.82},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-27 09:00:00"
    },
    {
      "dt": 1711540800,
      "main": {
        "temp": 15.78,
        "feels_like": 15.5,
        "temp_min": 15.78,
        "temp_max": 15.78,
        "pressure": 1027,
        "sea_level": 1027,
        "grnd_level": 1023,
        "humidity": 80,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 10},
      "wind": {"speed": 2.95, "deg": 159, "gust": 5.92},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-27 12:00:00"
    },
    {
      "dt": 1711551600,
      "main": {
        "temp": 14.83,
        "feels_like": 14.48,
        "temp_min": 14.83,
        "temp_max": 14.83,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1022,
        "humidity": 81,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02n"
        }
      ],
      "clouds": {"all": 17},
      "wind": {"speed": 2.66, "deg": 156, "gust": 5.9},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-27 15:00:00"
    },
    {
      "dt": 1711562400,
      "main": {
        "temp": 13.9,
        "feels_like": 13.51,
        "temp_min": 13.9,
        "temp_max": 13.9,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1022,
        "humidity": 83,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02n"
        }
      ],
      "clouds": {"all": 18},
      "wind": {"speed": 2.67, "deg": 156, "gust": 5.83},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-27 18:00:00"
    },
    {
      "dt": 1711573200,
      "main": {
        "temp": 13.7,
        "feels_like": 13.27,
        "temp_min": 13.7,
        "temp_max": 13.7,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1022,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {"all": 46},
      "wind": {"speed": 2.3, "deg": 153, "gust": 5.15},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-27 21:00:00"
    },
    {
      "dt": 1711584000,
      "main": {
        "temp": 17.87,
        "feels_like": 17.33,
        "temp_min": 17.87,
        "temp_max": 17.87,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1023,
        "humidity": 62,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 63},
      "wind": {"speed": 3.16, "deg": 169, "gust": 4.56},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-28 00:00:00"
    },
    {
      "dt": 1711594800,
      "main": {
        "temp": 19.72,
        "feels_like": 19.21,
        "temp_min": 19.72,
        "temp_max": 19.72,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1021,
        "humidity": 56,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 91},
      "wind": {"speed": 4.62, "deg": 193, "gust": 5.17},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-28 03:00:00"
    },
    {
      "dt": 1711605600,
      "main": {
        "temp": 19.82,
        "feels_like": 19.24,
        "temp_min": 19.82,
        "temp_max": 19.82,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1020,
        "humidity": 53,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 65},
      "wind": {"speed": 5.49, "deg": 190, "gust": 5.61},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-28 06:00:00"
    },
    {
      "dt": 1711616400,
      "main": {
        "temp": 17.12,
        "feels_like": 16.69,
        "temp_min": 17.12,
        "temp_max": 17.12,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1021,
        "humidity": 69,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 8},
      "wind": {"speed": 4.48, "deg": 174, "gust": 6.81},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-28 09:00:00"
    },
    {
      "dt": 1711627200,
      "main": {
        "temp": 15.79,
        "feels_like": 15.41,
        "temp_min": 15.79,
        "temp_max": 15.79,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1022,
        "humidity": 76,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 6},
      "wind": {"speed": 2.9, "deg": 162, "gust": 6.11},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-28 12:00:00"
    },
    {
      "dt": 1711638000,
      "main": {
        "temp": 14.4,
        "feels_like": 13.91,
        "temp_min": 14.4,
        "temp_max": 14.4,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1021,
        "humidity": 77,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 2.65, "deg": 147, "gust": 5.17},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-28 15:00:00"
    },
    {
      "dt": 1711648800,
      "main": {
        "temp": 12.96,
        "feels_like": 12.43,
        "temp_min": 12.96,
        "temp_max": 12.96,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1021,
        "humidity": 81,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.52, "deg": 105, "gust": 2.88},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-28 18:00:00"
    },
    {
      "dt": 1711659600,
      "main": {
        "temp": 12.53,
        "feels_like": 12.03,
        "temp_min": 12.53,
        "temp_max": 12.53,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1022,
        "humidity": 84,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.7, "deg": 21, "gust": 3.01},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-28 21:00:00"
    },
    {
      "dt": 1711670400,
      "main": {
        "temp": 19.44,
        "feels_like": 18.82,
        "temp_min": 19.44,
        "temp_max": 19.44,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1023,
        "humidity": 53,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.88, "deg": 26, "gust": 4.27},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-29 00:00:00"
    },
    {
      "dt": 1711681200,
      "main": {
        "temp": 26.45,
        "feels_like": 26.45,
        "temp_min": 26.45,
        "temp_max": 26.45,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1020,
        "humidity": 35,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 0.46, "deg": 9, "gust": 4.56},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-29 03:00:00"
    },
    {
      "dt": 1711692000,
      "main": {
        "temp": 27.45,
        "feels_like": 26.84,
        "temp_min": 27.45,
        "temp_max": 27.45,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1018,
        "humidity": 33,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.07, "deg": 175, "gust": 3.67},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-03-29 06:00:00"
    },
    {
      "dt": 1711702800,
      "main": {
        "temp": 22.51,
        "feels_like": 22.07,
        "temp_min": 22.51,
        "temp_max": 22.51,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1019,
        "humidity": 48,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 3.52, "deg": 123, "gust": 7.57},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-29 09:00:00"
    },
    {
      "dt": 1711713600,
      "main": {
        "temp": 19.67,
        "feels_like": 19.23,
        "temp_min": 19.67,
        "temp_max": 19.67,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1019,
        "humidity": 59,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 0.75, "deg": 42, "gust": 3.22},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-29 12:00:00"
    },
    {
      "dt": 1711724400,
      "main": {
        "temp": 18.39,
        "feels_like": 17.9,
        "temp_min": 18.39,
        "temp_max": 18.39,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1019,
        "humidity": 62,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.41, "deg": 37, "gust": 1.69},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-29 15:00:00"
    },
    {
      "dt": 1711735200,
      "main": {
        "temp": 17.7,
        "feels_like": 16.99,
        "temp_min": 17.7,
        "temp_max": 17.7,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1019,
        "humidity": 56,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {"all": 32},
      "wind": {"speed": 1.44, "deg": 26, "gust": 2.11},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-03-29 18:00:00"
    }
  ],
  "city": {
    "id": 2158177,
    "name": "Melbourne",
    "coord": {"lat": -37.8136, "lon": 144.9631},
    "country": "AU",
    "population": 15000,
    "timezone": 39600,
    "sunrise": 1711312051,
    "sunset": 1711355076
  }
};
