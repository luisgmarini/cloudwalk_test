import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/city_entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/entity/entity.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/presenter/components/forecast_tile_widget.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/presenter/components/search_weather_error_widget.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/presenter/components/weather_details_header.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/presenter/cubit/weather_details_cubit.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/presenter/cubit/weather_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/colors/custom_color.dart';

class WeatherDetailsScreenArgs {
  const WeatherDetailsScreenArgs({
    required this.currentWeather,
    required this.city,
  });

  final WeatherEntity currentWeather;
  final CityEntity city;
}

class WeatherDetailsScreen extends StatefulWidget {
  const WeatherDetailsScreen({
    super.key,
    required this.cubit,
    required this.args,
  });

  final WeatherDetailsCubit cubit;
  final WeatherDetailsScreenArgs args;

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.cubit.forecastNext5Days(widget.args.city);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Center(
            child: Column(
              children: [
                WeatherHeader(
                  city: widget.args.city.name,
                  icon: widget.args.currentWeather.weatherInfo.first.icon,
                  description:
                      widget.args.currentWeather.weatherInfo.first.main,
                  humidity: widget.args.currentWeather.humidity,
                  temp: widget.args.currentWeather.temp,
                ),
                BlocBuilder<WeatherDetailsCubit, WeatherDetailsState>(
                  bloc: widget.cubit,
                  builder: (context, state) {
                    final size = MediaQuery.sizeOf(context);
                    return switch (state) {
                      WeatherDetailsLoading() => Padding(
                          padding: EdgeInsets.only(top: size.height * 0.2),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: CustomColor.defaultBlack,
                            ),
                          ),
                        ),
                      WeatherDetailsLoaded() => Column(
                          children: [
                            const _DaysForecastWidget(),
                            const SizedBox(
                              height: 8,
                            ),
                            const Divider(),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.forecast.length,
                              itemBuilder: (context, index) {
                                return ForecastTileWidget(
                                  forecast: state.forecast[index],
                                );
                              },
                              separatorBuilder: (_, index) => const Divider(),
                            ),
                          ],
                        ),
                      WeatherDetailsError() => SearchWeatherErrorWidget(
                          padding: EdgeInsets.only(top: size.height * 0.1),
                        ),
                      _ => const SizedBox.shrink(),
                    };
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DaysForecastWidget extends StatelessWidget {
  const _DaysForecastWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.calendar_month),
        SizedBox(width: 8),
        Text('5-DAYS FORECAST')
      ],
    );
  }
}
