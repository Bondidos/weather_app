import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_current_with_forecast.dart';

abstract class WeatherRepository{
  Future<WeatherCurrentWithForecast> fetchWeatherFromApiOrLoadCache();
  Future<CurrentWeather> fetchCurrentWeatherForCity();
  Stream<String> subscribeLanguageChanged();
}