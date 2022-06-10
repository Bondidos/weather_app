import 'package:flutter/material.dart';
import 'package:weather_app/common/weather_icons.dart';
import 'package:weather_app/layers/domain/models/weather/weather.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/date_widget.dart';

class DailyWeatherForecast extends StatelessWidget {
  final DailyForecast dailyForecast;

  const DailyWeatherForecast({Key? key, required this.dailyForecast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 8;

    return Card(
      color: Theme.of(context).colorScheme.primary,
      elevation: 24,
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        height: height,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DateWidget(
              timeStamp: dailyForecast.timeStamp,
            ),
            buildWeatherIconWithDescription(dailyForecast.weather),
            buildMaxMinTemperature(
              dailyForecast.maxTemp,
              dailyForecast.minTemp,
            ),
          ],
        ),
      ),
    );
  }

  Column buildWeatherIconWithDescription(Weather weather) {
    return Column(
      children: [
        buildWeatherIcon(weather.icon),
        buildDescription(weather),
      ],
    );
  }

  Flexible buildWeatherIcon(String iconId) {
    return Flexible(
        child: Image.asset(
      WeatherIcons.getIconLink(iconId),
    ));
  }

  Text buildDescription(Weather weather) => Text(weather.description);

  Text buildMaxMinTemperature(double maxTemp, double minTemp) =>
      Text("$maxTemp\u00B0/$minTemp\u00B0");
}
