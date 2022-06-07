import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_cuurent_with_forecast.dart';

abstract class WeatherRepository{
  Future<WeatherCurrentWithForecast> fetchWeatherFromApiOrLoadCache();
}