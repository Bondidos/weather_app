import 'package:json_annotation/json_annotation.dart';

part 'main_api.g.dart';

@JsonSerializable()
class MainApi{
  final double temp;
  final double feelsLike;
  final double tempMin;
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