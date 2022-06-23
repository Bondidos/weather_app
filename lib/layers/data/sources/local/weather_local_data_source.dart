import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_current_with_forecast.dart';

abstract class WeatherLocalDataSource {
  void saveCurrentWithForecast(WeatherCurrentWithForecast currentWithForecast);

  Future<WeatherCurrentWithForecast> fetchActualDataFromLocal();
}
