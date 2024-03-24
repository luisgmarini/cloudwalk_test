import 'package:cloudwalk_weather_test/app/modules/home/presenter/components/home_search_field.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/components/home_weather_card.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/components/welcome_widget.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/cubit/home_state.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/presenter/weather_details_screen.dart';
import 'package:cloudwalk_weather_test/app/routing/app_generate_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/components.dart';
import '../../weather/presenter/components/search_weather_error_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _goToCityDetails({
    required WeatherDetailsScreenArgs args,
  }) {
    Navigator.of(context).pushNamed(
      AppGenerateRouter.routeWeatherDetails,
      arguments: args,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Weather',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              HomeSearchField(
                onSelected: (city) =>
                    widget.homeCubit.fetchCurrentWeather(city),
              ),
              const SizedBox(height: 24),
              BlocBuilder<HomeCubit, HomeState>(
                bloc: widget.homeCubit,
                builder: (ctx, state) {
                  final size = MediaQuery.sizeOf(context);
                  return switch (state) {
                    HomeInitial() => const WelcomeWidget(),
                    HomeLoading() => Padding(
                        padding: EdgeInsets.only(top: size.height * 0.2),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: CustomColor.defaultBlack,
                          ),
                        ),
                      ),
                    HomeLoaded() => HomeWeatherCard(
                        currentWeatherEntity: state.currentWeatherEntity,
                        cityEntity: state.cityEntity,
                        onCardTap: () => _goToCityDetails(
                          args: WeatherDetailsScreenArgs(
                            currentWeather: state.currentWeatherEntity,
                            city: state.cityEntity,
                          ),
                        ),
                      ),
                    HomeError() => Center(
                        child: SearchWeatherErrorWidget(
                          padding: EdgeInsets.only(top: size.height * 0.2),
                        ),
                      ),
                    _ => const SizedBox.shrink(),
                  };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
