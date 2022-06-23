import 'package:weather_app/layers/domain/models/weather/weather.dart';

class HourlyForecast {
  final int timeStamp;
  final double temp;
  final Weather weather;

  const HourlyForecast({
    required this.timeStamp,
    required this.temp,
    required this.weather,
  });
}
