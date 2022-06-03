import 'package:flutter/material.dart';
import 'package:weather_app/layers/presentation/main_page/weather_by_location_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const WeatherByLocationPage(),
    );
  }
}

