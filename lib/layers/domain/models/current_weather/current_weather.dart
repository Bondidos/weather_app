import 'package:weather_app/layers/domain/models/current_weather/coordinates.dart';
import 'package:weather_app/layers/domain/models/current_weather/main.dart';
import 'package:weather_app/layers/domain/models/weather/weather.dart';

class CurrentWeather{
  final int timeStamp;

  final int code;

  final String name;

  final Coordinates coordinates;

  final List<Weather> weather;

  final Main main;

  const CurrentWeather({
    required this.timeStamp,
    required this.code,
    required this.coordinates,
    required this.weather,
    required this.main,
    required this.name
  });
}