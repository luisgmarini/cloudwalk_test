import 'package:cloudwalk_weather_test/app/modules/home/presenter/components/weather_card.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/components/welcome_widget.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/cubit/home_state.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/domain/constants/main_cities_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/components.dart';

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
    widget.homeCubit.fetchCurrentWeather(MainCities.list[1]);
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
              AppTextField(
                hintText: 'Search for a city',
                enabled: true,
                textEditingController: _searchController,
                suffixIcon: const Icon(Icons.search),
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
