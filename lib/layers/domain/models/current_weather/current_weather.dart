import 'package:weather_app/layers/domain/models/weather/weather.dart';

class CurrentWeather {
  final int timeStamp;
  final String name;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final Weather weather;

  const CurrentWeather({
    required this.timeStamp,
    required this.weather,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.name,
  });
}
