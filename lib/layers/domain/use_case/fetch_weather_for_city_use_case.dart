import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/repository/weather_repository.dart';

class FetchWeatherForCityUseCase {
  final WeatherRepository weatherRepository;

  const FetchWeatherForCityUseCase({
    required this.weatherRepository,
  });

  Future<CurrentWeather> execute() =>
      weatherRepository.fetchCurrentWeatherForCity();
}
