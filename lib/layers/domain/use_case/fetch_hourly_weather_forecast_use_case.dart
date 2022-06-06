import 'package:weather_app/layers/domain/models/hourly_weather_forecast/hourly_forecast.dart';
import 'package:weather_app/layers/domain/repository/weather_repository.dart';

class FetchHourlyWeatherForecastUseCase {
  final WeatherRepository weatherRepository;

  const FetchHourlyWeatherForecastUseCase({
    required this.weatherRepository,
  });

  Future<List<HourlyForecast>> execute() =>
      weatherRepository.fetchHourlyWeatherForecast();
}
