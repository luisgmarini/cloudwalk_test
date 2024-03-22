import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'routing/app_generate_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppGenerateRouter.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'CloudWalk Weather Test',
      initialRoute: AppGenerateRouter.routeHome,
      onGenerateRoute: AppGenerateRouter.onGenerateRoutes,
      locale: const Locale('pt-BR'),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      supportedLocales: const [
        Locale('pt'),
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        Locale? selectedLocale;
        if (deviceLocale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == deviceLocale.languageCode) {
              selectedLocale = deviceLocale;
            }
          }
        }
        selectedLocale ??= supportedLocales.first;
        Intl.defaultLocale = selectedLocale.toString();
        return selectedLocale;
      },
      // builder: (context, widget) {
      //   return widget;
      // },
    );
  }
}
