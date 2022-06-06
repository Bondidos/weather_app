import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/layers/data/models/remote/current_weather/coordinates_api.dart';
import 'package:weather_app/layers/data/models/remote/current_weather/main_api.dart';
import 'package:weather_app/layers/data/models/remote/weather/weather_api.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';

part 'current_weather_api.g.dart';

@JsonSerializable()
class CurrentWeatherApi {
  @JsonKey(name: 'dt')
  final int timeStamp;

  @JsonKey(name: 'cod')
  final int code;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'coord')
  final CoordinatesApi coordinates;

  @JsonKey(name: 'weather')
  final List<WeatherApi> weather;

  @JsonKey(name: 'main')
  final MainApi main;

  const CurrentWeatherApi({
    required this.timeStamp,
    required this.code,
    required this.coordinates,
    required this.weather,
    required this.main,
    required this.name
  });

  factory CurrentWeatherApi.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherApiFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherApiToJson(this);

  CurrentWeather toCurrentWeather() => CurrentWeather(
    timeStamp: timeStamp,
    code: code,
    name: name,
    coordinates: coordinates.toCoordinates(),
    weather: weather.map((item) => item.toWeather()).toList(),
    main: main.toMain(),
  );
}
