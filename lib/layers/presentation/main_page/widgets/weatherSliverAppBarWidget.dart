import 'package:flutter/material.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/presentation/common/widgets/current_weather_common_widgets.dart';

class WeatherSliverAppBar extends StatelessWidget {
  final CurrentWeather currentWeather;

  const WeatherSliverAppBar({Key? key, required this.currentWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height / 2;
    return SliverAppBar(
      expandedHeight: appBarHeight,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: buildTitle(currentWeather.name),
        background: buildCurrentWeatherWidget(currentWeather, context),
      ),
    );
  }

  Align buildTitle(String cityName) =>
      Align(alignment: Alignment.center, child: Text(cityName));

  Widget buildCurrentWeatherWidget(
      CurrentWeather currentWeather, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildCurrentWeather(currentWeather, context),
        buildLastUpdateTime(context, currentWeather)
      ],
    );
  }

  Align buildLastUpdateTime(
      BuildContext context, CurrentWeather currentWeather) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "openweathermap.org",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            CurrentDate(timeStamp: currentWeather.timeStamp),
          ],
        ),
      ),
    );
  }

  Column buildCurrentWeather(
      CurrentWeather currentWeather, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CurrentTemperature(
          temp: currentWeather.temp,
        ),
        MaxAndMinTemperature(
          tempMax: currentWeather.tempMax,
          tempMin: currentWeather.tempMin,
        ),
        Description(description: currentWeather.weather.description),
      ],
    );
  }

}

