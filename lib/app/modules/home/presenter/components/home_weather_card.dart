import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:cloudwalk_weather_test/core/components/colors/custom_color.dart';
import 'package:flutter/material.dart';

class HomeWeatherCard extends StatelessWidget {
  const HomeWeatherCard({
    super.key,
    required this.currentWeatherEntity,
    required this.cityEntity,
    required this.onCardTap,
  });

  final WeatherEntity currentWeatherEntity;
  final CityEntity cityEntity;
  final VoidCallback onCardTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: CustomColor.grayTelperion,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: InkWell(
        onTap: onCardTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardHeader(
              city: cityEntity.name,
              description: currentWeatherEntity.weatherInfo.first.main,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CachedNetworkImage(
                  height: 70,
                  imageUrl: currentWeatherEntity.weatherInfo.first.icon,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Text(
                  '${currentWeatherEntity.temp.toInt()}°C',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    required this.city,
    required this.description,
  });

  final String city;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ],
    );
  }
}
