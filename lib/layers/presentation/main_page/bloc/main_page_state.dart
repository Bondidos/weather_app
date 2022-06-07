import 'package:equatable/equatable.dart';
import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_cuurent_with_forecast.dart';

enum MainPageStatus { initial, loading, loaded, error }

class MainPageState extends Equatable {
  final WeatherCurrentWithForecast? weatherCurrentWithForecast;
  final MainPageStatus status;

  const MainPageState({
    required this.weatherCurrentWithForecast,
    required this.status,
  });

  MainPageState copyWith({
    WeatherCurrentWithForecast? weatherCurrentWithForecast,
    MainPageStatus? status,
  }) =>
      MainPageState(
        weatherCurrentWithForecast:
            weatherCurrentWithForecast ?? this.weatherCurrentWithForecast,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [weatherCurrentWithForecast, status];
}

class MainPageError extends MainPageState {
  final String message;

  const MainPageError({
    required WeatherCurrentWithForecast? weatherCurrentWithForecast,
    required MainPageStatus status,
    required this.message,
  }) : super(
          weatherCurrentWithForecast: weatherCurrentWithForecast,
          status: status,
        );
}
