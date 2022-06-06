import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/layers/domain/models/current_weather/coordinates.dart';

part 'coordinates_api.g.dart';

@JsonSerializable()
class CoordinatesApi{
  @JsonKey(name: 'lat')
  final double lat;

  @JsonKey(name: 'lon')
  final double lon;

  const CoordinatesApi({
    required this.lat,
    required this.lon,
  });

  factory CoordinatesApi.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesApiFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesApiToJson(this);

  Coordinates toCoordinates() => Coordinates(lat: lat, lon: lon);
}