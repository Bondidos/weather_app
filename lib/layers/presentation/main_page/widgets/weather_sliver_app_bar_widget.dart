import 'package:flutter/material.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:weather_app/common/weather_icons.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/presentation/common/widgets/current_weather_common_widgets.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/date_widget.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/description_widget.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/max_and_min_temperature.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/time_since_last_update.dart';

const apiAddress = "openweathermap.org";

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
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        centerTitle: true,
        expandedTitleScale: 1.7,
        title: buildTitle(currentWeather.name),
        background: buildCurrentWeatherWidget(currentWeather, context),
      ),
    );
  }

  Align buildTitle(String cityName) => Align(
      alignment: Alignment.center,
      child: Text(
        cityName,
        style: const TextStyle().apply(color: Colors.white),
      ));

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

  Flexible buildWeatherIcon(String iconId) {
    return Flexible(
      child: Image.asset(
        WeatherIcons.getIconLink(iconId),
      ),
    );
  }

  Align buildLastUpdateTime(
      BuildContext context, CurrentWeather currentWeather) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              apiAddress,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            buildDateWidget(currentWeather.timeStamp),
          ],
        ),
      ),
    );
  }

  FutureBuilder buildDateWidget(int timeStamp) {
    return FutureBuilder<bool>(
      future: isConnected(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return (snapshot.data!)
              ? DateWidget(timeStamp: timeStamp)
              : TimeSinceLastUpdate(timeStamp: timeStamp);
        }
        return Container();
      },
    );
  }

  Future<bool> isConnected() => SimpleConnectionChecker.isConnectedToInternet();

  Column buildCurrentWeather(
      CurrentWeather currentWeather, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 9,
        ),
        buildWeatherIcon(currentWeather.weather.icon),
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
