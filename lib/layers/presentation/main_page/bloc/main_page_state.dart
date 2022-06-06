import 'package:equatable/equatable.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';

enum MainPageStatus { initial, loading, loaded, error }

class MainPageState extends Equatable {
  final CurrentWeather? currentWeather;
  final MainPageStatus status;

  const MainPageState({required this.currentWeather, required this.status});

  MainPageState copyWith({
    CurrentWeather? currentWeather,
    MainPageStatus? status,
  }) =>
      MainPageState(
        currentWeather: currentWeather ?? this.currentWeather,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [currentWeather, status];
}

class MainPageError extends MainPageState {
  final String message;

  const MainPageError({
    required CurrentWeather? currentWeather,
    required MainPageStatus status,
    required this.message,
  }) : super(
          currentWeather: currentWeather,
          status: status,
        );
}
