import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_cuurent_with_forecast.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/hourly_forecast.dart';

abstract class WeatherLocalDataSource {
  Future<void> saveCurrentWeather(CurrentWeather currentWeather);

  Future<void> saveHourlyForecast(List<HourlyForecast> list);

  Future<void> saveDailyForeCast(List<DailyForecast> list);

  Future<WeatherCurrentWithForecast> fetchActualDataFromLocal();
}
