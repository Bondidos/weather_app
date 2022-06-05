import 'package:json_annotation/json_annotation.dart';

part 'weather_api.g.dart';

@JsonSerializable()
class WeatherApi {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'main')
  final String main;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'icon')
  final String icon;

  const WeatherApi({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherApi.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherApiToJson(this);
}