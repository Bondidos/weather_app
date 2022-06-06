import 'package:equatable/equatable.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/hourly_weather_forecast/hourly_forecast.dart';

enum MainPageStatus { initial, loading, loaded, error }

class MainPageState extends Equatable {
  final CurrentWeather? currentWeather;
  final List<HourlyForecast> hourlyForecast;
  final MainPageStatus status;

  const MainPageState({
    required this.currentWeather,
    required this.status,
    required this.hourlyForecast,
  });

  MainPageState copyWith({
    CurrentWeather? currentWeather,
    MainPageStatus? status,
    List<HourlyForecast>? hourlyForecast,
  }) =>
      MainPageState(
        currentWeather: currentWeather ?? this.currentWeather,
        status: status ?? this.status,
        hourlyForecast: hourlyForecast ?? this.hourlyForecast,
      );

  @override
  List<Object?> get props => [currentWeather, hourlyForecast, status];
}

class MainPageError extends MainPageState {
  final String message;

  const MainPageError({
    required CurrentWeather? currentWeather,
    required MainPageStatus status,
    required final List<HourlyForecast> hourlyForecast,
    required this.message,
  }) : super(
          currentWeather: currentWeather,
          hourlyForecast: hourlyForecast,
          status: status,
        );
}
