import 'package:cloudwalk_weather_test/app/modules/home/presenter/home_screen.dart';
import 'package:flutter/material.dart';

class AppGenerateRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  AppGenerateRouter._();

  static const String routeHome = '/home';

  static Route? onGenerateRoutes(RouteSettings settings) {
    final route = settings.name;
    Widget? routePage;

    switch (route) {
      case routeHome:
        routePage = const HomeScreen();
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
