import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app/common/constants.dart';
import 'package:weather_app/layers/data/sources/local/settings/l18n_settings.dart';
import 'package:weather_app/layers/presentation/city_page/city_weather_page.dart';
import 'package:weather_app/layers/presentation/main_page/weather_by_location_page.dart';
import 'package:weather_app/injection_container.dart' as di;

import 'generated/l10n.dart';

const lifeCycleResumed = "resumed";

void main() async {
  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final LocalisationSettings localisationSettings =
      di.inj<LocalisationSettings>();

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state.name == lifeCycleResumed) {
      final String currentLanguage = localisationSettings.currentLanguage;
      final String defaultLocale = Platform.localeName;
      if (!defaultLocale.contains(currentLanguage)) {
        currentLanguage == languageRussian
            ? localisationSettings.setEnglishLanguage()
            : localisationSettings.setRussianLanguage();
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

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
