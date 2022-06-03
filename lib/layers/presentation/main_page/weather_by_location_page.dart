import 'package:flutter/material.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/floatingButtonSearch.dart';

class WeatherByLocationPage extends StatelessWidget {
  const WeatherByLocationPage({Key? key}) : super(key: key);

  static const String id = "WeatherByLocation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather in your location'),
      ),
      body: Stack(
        children: const [
          FloatingButtonSearch(heroTag: id),
        ],
      ),
    );
  }
}
