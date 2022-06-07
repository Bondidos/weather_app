import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/layers/data/models/remote/current_weather/main_api.dart';
import 'package:weather_app/layers/data/models/remote/weather/weather_api.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';

part 'current_weather_api.g.dart';

@JsonSerializable()
class CurrentWeatherApi {
  @JsonKey(name: 'dt')
  final int timeStamp;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'weather')
  final List<WeatherApi> weather;

  @JsonKey(name: 'main')
  final MainApi main;

  const CurrentWeatherApi(
      {required this.timeStamp,
      required this.weather,
      required this.main,
      required this.name});

  factory CurrentWeatherApi.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherApiFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherApiToJson(this);

  CurrentWeather toCurrentWeather() => CurrentWeather(
        timeStamp: timeStamp,
        name: name,
        weather: weather.first.toWeather(),
        tempMax: main.tempMax,
        feelsLike: main.feelsLike,
        temp: main.temp,
        tempMin: main.tempMin,
      );
}
