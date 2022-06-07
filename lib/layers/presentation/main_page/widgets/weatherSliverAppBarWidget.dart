import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';

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
            buildTime(currentWeather.timeStamp, context),
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
        buildCurrentTemperature(currentWeather.temp, context),
        buildMaxMinTemperature(
          currentWeather.tempMax,
          currentWeather.tempMin,
          context,
        ),
        buildWeatherDescription(currentWeather.weather.description, context),
      ],
    );
  }

  Padding buildCurrentTemperature(double temp, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        "$temp\u00B0",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Padding buildMaxMinTemperature(
    double tempMax,
    double tempMin,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        "$tempMax\u00B0/$tempMin\u00B0",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Text buildWeatherDescription(String description, BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Text buildTime(int timeStamp, BuildContext context) {
    // todo should to show am/pm at us locale
    var format = DateFormat.MMMEd('en_US'); //todo last updated ....
    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var dateString = format.format(date);
    return Text(
      dateString,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
