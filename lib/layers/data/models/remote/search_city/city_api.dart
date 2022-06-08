import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/layers/domain/models/search_city/city.dart';

part 'city_api.g.dart';

@JsonSerializable()
class CityApi {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'lat')
  final double latitude;

  @JsonKey(name: 'lon')
  final double longitude;

  @JsonKey(name: 'country')
  final String country;

  const CityApi({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  factory CityApi.fromJson(Map<String, dynamic> json) =>
      _$CityApiFromJson(json);

  Map<String, dynamic> toJson() => _$CityApiToJson(this);

  City toCity() => City(name: name, country: country);
}
