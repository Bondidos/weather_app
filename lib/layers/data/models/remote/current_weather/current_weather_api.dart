import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/layers/data/models/remote/current_weather/coordinates_api.dart';
import 'package:weather_app/layers/data/models/remote/weather/weather_api.dart';

part 'current_weather_api.g.dart';

@JsonSerializable()
class CurrentWeatherApi {
  @JsonKey(name: 'dt')
  final int timeStamp;

  @JsonKey(name: 'cod')
  final int code;

  @JsonKey(name: 'coord')
  final CoordinatesApi coordinates;

  @JsonKey(name: 'weather')
  final List<WeatherApi> weather;

  @JsonKey(name: 'main')
  final List<WeatherApi> main;

  const CurrentWeatherApi({
    required this.timeStamp,
    required this.code,
    required this.coordinates,
    required this.weather,
    required this.main,
  });

  factory CurrentWeatherApi.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherApiFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherApiToJson(this);
}
