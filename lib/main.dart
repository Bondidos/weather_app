import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app/layers/presentation/city_page/city_weather_page.dart';
import 'package:weather_app/layers/presentation/main_page/weather_by_location_page.dart';
import 'package:weather_app/injection_container.dart' as di;

import 'generated/l10n.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blueAccent[100],
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
            decorationColor: Colors.white,
        ),
      ),
      routes: {
        CityWeatherPage.id: (_) => const CityWeatherPage(),
        WeatherByLocationPage.id: (_) => const WeatherByLocationPage(),
      },
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const WeatherByLocationPage(),
    );
  }
}
