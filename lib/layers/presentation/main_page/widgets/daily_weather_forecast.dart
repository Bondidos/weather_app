import 'package:flutter/material.dart';
import 'package:weather_app/common/weather_icons.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/layers/domain/models/weather/weather.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/date_widget.dart';

import 'divider_with_padding.dart';

class DailyWeatherForecast extends StatelessWidget {
  final DailyForecast dailyForecast;
  final bool isTomorrow;

  const DailyWeatherForecast({
    Key? key,
    required this.dailyForecast,
    required this.isTomorrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 8;

    return Column(
      children: [
        Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            height: height,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildDateWidget(),
                  buildWeatherIconWithDescription(dailyForecast.weather),
                  buildMaxMinTemperature(
                    dailyForecast.maxTemp,
                    dailyForecast.minTemp,
                  ),
                ],
              ),
            ),
          ),
        ),
        const DividerWithPadding(),
      ],
    );
  }

  Column buildDateWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isTomorrow) Text(S.current.Tomorrow),
        DateWidget(timeStamp: dailyForecast.timeStamp),
      ],
    );
  }

  Expanded buildWeatherIconWithDescription(Weather weather) {
    return Expanded(
      child: Column(
        children: [
          buildWeatherIcon(weather.icon),
          buildDescription(weather),
        ],
      ),
    );
  }

  Flexible buildWeatherIcon(String iconId) {
    return Flexible(
        child: Image.asset(
      WeatherIcons.getIconLink(iconId),
    ));
  }

  Text buildDescription(Weather weather) => Text(weather.description);

  Text buildMaxMinTemperature(double maxTemp, double minTemp) => Text(
      "${maxTemp.toStringAsFixed(0)}\u00B0/${minTemp.toStringAsFixed(0)}\u00B0");
}
