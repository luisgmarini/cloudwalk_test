import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({
    super.key,
    required this.city,
    required this.icon,
    required this.description,
    required this.humidity,
    required this.temp,
  });

  final String city;
  final String icon;
  final String description;
  final double humidity;
  final double temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          city,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${temp.toInt()}°C',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            CachedNetworkImage(
              height: 120,
              imageUrl: icon,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Humidity: ${humidity.toInt()}%',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
