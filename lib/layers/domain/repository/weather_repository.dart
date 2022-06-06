import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';

abstract class WeatherRepository{
  Future <CurrentWeather> fetchCurrentWeatherInLocation();
}