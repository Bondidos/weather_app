import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/hourly_forecast.dart';

class WeatherCurrentWithForecast{
  final CurrentWeather currentWeather;
  final List<DailyForecast> dailyForecast;
  final List<HourlyForecast> hourlyForecast;

  const WeatherCurrentWithForecast({
    required this.currentWeather,
    required this.dailyForecast,
    required this.hourlyForecast,
  });
}