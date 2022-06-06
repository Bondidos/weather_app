import 'package:weather_app/layers/data/models/remote/current_weather/current_weather_api.dart';
import 'package:weather_app/layers/data/sources/remote_data_source.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
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
}
