import 'package:flutter/material.dart';

class SearchWeatherErrorWidget extends StatelessWidget {
  const SearchWeatherErrorWidget({
    super.key,
    required this.padding,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          const Icon(
            Icons.report_gmailerrorred,
            size: 90,
          ),
          const SizedBox(height: 16),
          Text(
            'Something went wrong 😕 \nPlease try again!',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
