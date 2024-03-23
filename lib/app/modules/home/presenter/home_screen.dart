import 'package:cloudwalk_weather_test/app/modules/home/presenter/components/home_search_field.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/components/weather_card.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/components/welcome_widget.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/components.dart';
import 'components/search_weather_error_widget.dart';

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
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
                    HomeLoaded() => WeatherCard(
                        currentWeatherEntity: state.currentWeatherEntity,
                        cityEntity: state.cityEntity,
                        onCardTap: () => {},
                      ),
                    HomeError() => const SearchWeatherErrorWidget(),
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
