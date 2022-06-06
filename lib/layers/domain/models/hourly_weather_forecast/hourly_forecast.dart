import 'package:weather_app/layers/domain/models/weather/weather.dart';

class HourlyForecast {
  final int timeStamp;

  final List<Weather> weather;

  const HourlyForecast({
    required this.timeStamp,
    required this.weather,
  });
}
