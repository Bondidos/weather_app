import 'package:json_annotation/json_annotation.dart';

part 'coordinates_api.g.dart';

@JsonSerializable()
class CoordinatesApi{
  @JsonKey(name: 'lat')
  final int lat;

  @JsonKey(name: 'lon')
  final int lon;

  const CoordinatesApi({
    required this.lat,
    required this.lon,
  });

  factory CoordinatesApi.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesApiFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesApiToJson(this);
}