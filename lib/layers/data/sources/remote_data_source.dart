import 'package:weather_app/layers/data/models/remote/current_weather/current_weather_api.dart';

abstract class RemoteDataSource{

  Future<CurrentWeatherApi> fetchCurrentWeather();
}