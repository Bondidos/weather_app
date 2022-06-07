import 'package:weather_app/layers/data/models/remote/current_weather/current_weather_api.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/hourly/weather_forecast_api.dart';

abstract class RemoteDataSource{
  Future<CurrentWeatherApi> fetchCurrentWeather();
  Future<WeatherForecastApi> fetchWeatherForecast();
}