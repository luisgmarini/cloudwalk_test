import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/string_utils.dart';

class ForecastTileWidget extends StatelessWidget {
  const ForecastTileWidget({
    super.key,
    required this.forecast,
  });

  final WeatherEntity forecast;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringUtils.dateForecastFormat(
                forecast.date ?? '',
              ),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              forecast.weatherInfo.first.description,
            ),
          ],
        ),
        const SizedBox(width: 16),
        const Spacer(),
        Column(
          children: [
            Row(
              children: [
                Text(
                  '${forecast.temp.toInt()}°C',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CachedNetworkImage(
                  height: 60,
                  imageUrl: forecast.weatherInfo.first.icon,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ],
            ),
            Text(
              'H: ${forecast.humidity}%',
            ),
          ],
        ),
      ],
    );
  }
}
