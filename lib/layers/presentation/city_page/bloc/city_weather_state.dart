import 'package:equatable/equatable.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';

enum CityWeatherStatus { initial, loading, loaded, error }

class CityWeatherState extends Equatable {
  final CurrentWeather? currentWeather;
  final CityWeatherStatus status;

  const CityWeatherState({
    required this.currentWeather,
    required this.status,
  });

  @override
  List<Object?> get props => [currentWeather, status];

  CityWeatherState copyWith(
      {CurrentWeather? currentWeather, CityWeatherStatus? status}) {
    return CityWeatherState(
      currentWeather: currentWeather ?? this.currentWeather,
      status: status ?? this.status,
    );
  }
}

class CityWeatherError extends CityWeatherState {
  const CityWeatherError({
    required CityWeatherStatus status,
    required this.message,
  }) : super(currentWeather: null, status: status);
  final String message;
}
