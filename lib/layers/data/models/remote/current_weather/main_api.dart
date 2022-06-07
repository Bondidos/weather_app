import 'package:json_annotation/json_annotation.dart';

part 'main_api.g.dart';

@JsonSerializable()
class MainApi {
  @JsonKey(name: 'temp')
  final double temp;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  const MainApi({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
  });

  factory MainApi.fromJson(Map<String, dynamic> json) =>
      _$MainApiFromJson(json);

  Map<String, dynamic> toJson() => _$MainApiToJson(this);
}
