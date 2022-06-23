import 'package:weather_app/layers/domain/models/weather/weather.dart';

class DailyForecast {
  final int timeStamp;
  final double minTemp;
  final double maxTemp;
  final Weather weather;

  const DailyForecast({
    required this.timeStamp,
    required this.minTemp,
    required this.maxTemp,
    required this.weather,
  });
}
