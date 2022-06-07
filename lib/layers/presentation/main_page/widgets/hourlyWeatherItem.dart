import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/weather_icons.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/hourly_forecast.dart';

final WeatherIcons iconAssets = WeatherIcons();

class HourlyWeatherItem extends StatelessWidget {
  final HourlyForecast hourlyForecast;

  const HourlyWeatherItem({
    Key? key,
    required this.hourlyForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 4;
    return Card(
      color: Theme.of(context).colorScheme.primary,
      elevation: 24,
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        width: width,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTime(hourlyForecast.timeStamp),
            buildWeatherIcon(hourlyForecast.weather.icon),
            buildDescription(hourlyForecast.weather.description),
            buildTemperature(hourlyForecast.temp),
          ],
        ),
      ),
    );
  }

  Text buildTime(int timeStamp) {
    // todo should to show am/pm at us locale
    var format = DateFormat('hh:mm aa', 'en_US');
    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var dateString = format.format(date);
    return Text(dateString);
  }

  Flexible buildWeatherIcon(String iconId) {
    return Flexible(
      flex: 2,
      child: Image.asset(
        iconAssets.getIconLink(iconId),
      ),
    );
  }

  Expanded buildDescription(String description) {
    return Expanded(
      child: Text(
        description,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }

  Text buildTemperature(double temp) => Text("$temp\u00B0");
}
