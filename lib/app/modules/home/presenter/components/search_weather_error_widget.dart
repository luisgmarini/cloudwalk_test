import 'package:flutter/material.dart';

class SearchWeatherErrorWidget extends StatelessWidget {
  const SearchWeatherErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
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
