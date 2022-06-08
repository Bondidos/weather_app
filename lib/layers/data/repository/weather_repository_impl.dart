import 'package:weather_app/layers/data/models/remote/current_weather/current_weather_api.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/hourly/weather_forecast_api.dart';
import 'package:weather_app/layers/data/repository/extensions.dart';
import 'package:weather_app/layers/data/sources/remote/remote_data_source.dart';
import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_cuurent_with_forecast.dart';
import 'package:weather_app/layers/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<WeatherCurrentWithForecast> fetchWeatherFromApiOrLoadCache() async {
    CurrentWeatherApi currentWeatherApi =
        await remoteDataSource.fetchCurrentWeather();
    WeatherForecastApi forecast = await remoteDataSource.fetchWeatherForecast();
    return _createWeatherCurrentWithForecast(currentWeatherApi, forecast);
  }

  WeatherCurrentWithForecast _createWeatherCurrentWithForecast(
    CurrentWeatherApi currentWeatherApi,
    WeatherForecastApi forecast,
  ) =>
      WeatherCurrentWithForecast(
        currentWeather: currentWeatherApi.toCurrentWeather(),
        dailyForecast: forecast.daily.toDailyForecastList(),
        hourlyForecast: forecast.hourly.toHourlyForecastList(),
      );
}
