import 'package:flutter/material.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/floatingButtonSearch.dart';

class WeatherByLocationPage extends StatelessWidget {
  const WeatherByLocationPage({Key? key}) : super(key: key);

  static const String id = "WeatherByLocation";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const FloatingButtonSearch(heroTag: id),
            buildWeatherPage(),
          ],
        ),
      ),
    );
  }

  CustomScrollView buildWeatherPage() => CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: buildTitle(),
              background: buildWeatherWidget(),
            ),
          )
        ],
      );

  Align buildTitle() {
    return const Align(alignment: Alignment.center, child: Text("CITY NAME"));
  }

  /**
   * Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      const Text("CITY NAME"),
      const Text("Temperature widget"),
      const Text("Weather Description widget"),
      const Text("min/max temperature widget"),
      buildWeatherIconAndDate(),
      ],
      ),
      );
   */

  Row buildWeatherIconAndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text("Weather Icon"),
        Text("Date Widget"),
      ],
    );
  }

  Widget buildWeatherWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Text("1"),
        Text("2"),
        Text("3"),
      ]),
    );
  }
}
