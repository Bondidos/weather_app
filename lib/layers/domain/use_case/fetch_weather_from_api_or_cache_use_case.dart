import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_cuurent_with_forecast.dart';
import 'package:weather_app/layers/domain/repository/weather_repository.dart';

class FetchWeatherFromApiOrCacheUseCase {
  final WeatherRepository weatherRepository;

  const FetchWeatherFromApiOrCacheUseCase({
    required this.weatherRepository,
  });

  Future<WeatherCurrentWithForecast> execute() =>
      weatherRepository.fetchWeatherFromApiOrLoadCache();
}
