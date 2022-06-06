import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/hourly_weather_forecast/hourly_forecast.dart';

abstract class WeatherRepository{
  Future <CurrentWeather> fetchCurrentWeatherInLocation();
  Future<List<HourlyForecast>> fetchHourlyWeatherForecast();
}