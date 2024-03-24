import 'package:cloudwalk_weather_test/app/modules/home/presenter/cubit/home_cubit.dart';
import 'package:cloudwalk_weather_test/app/modules/home/presenter/home_screen.dart';
import 'package:cloudwalk_weather_test/app/modules/weather/presenter/weather_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../modules/weather/presenter/cubit/weather_details_cubit.dart';

class AppGenerateRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  AppGenerateRouter._();

  static const String routeHome = '/home';
  static const String routeWeatherDetails = '/weather-details';

  static Route? onGenerateRoutes(RouteSettings settings) {
    final route = settings.name;
    Widget? routePage;

    switch (route) {
      case routeHome:
        routePage = HomeScreen(
          homeCubit: GetIt.I.get<HomeCubit>(),
        );
        break;
      case routeWeatherDetails:
        routePage = WeatherDetailsScreen(
          cubit: GetIt.I.get<WeatherDetailsCubit>(),
          args: settings.arguments as WeatherDetailsScreenArgs,
        );
        break;
    }

    if (routePage == null) {
      return null;
    }

    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (_, __, ___) {
        return routePage!;
      },
      transitionsBuilder: (_, animation, ___, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;

        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }
}
