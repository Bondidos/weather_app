import 'package:weather_app/layers/data/models/remote/current_weather/current_weather_api.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/weather_forecast_api.dart';
import 'package:weather_app/layers/data/sources/remote_data_source.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/hourly_weather_forecast/hourly_forecast.dart';
import 'package:weather_app/layers/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<CurrentWeather> fetchCurrentWeatherInLocation() async {
    CurrentWeatherApi currentWeatherApi =
        await remoteDataSource.fetchCurrentWeather();
    return currentWeatherApi.toCurrentWeather();
  }

  @override
  Future<List<HourlyForecast>> fetchHourlyWeatherForecast() async {
    WeatherForecastApi hourlyWeatherForecastApi =
        await remoteDataSource.fetchHourlyWeatherForecast();
    return hourlyWeatherForecastApi.pickNextSixHours();
  }
}

extension PickSixHoursForecast on WeatherForecastApi {
  List<HourlyForecast> pickNextSixHours() {
    List<HourlyForecast> result = [];
    for (var i = 0; i < 6; i++) {
      result.add(hourly[i].toHourlyForecast());
    }
    return result;
  }
}
