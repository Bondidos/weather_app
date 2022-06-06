import 'package:json_annotation/json_annotation.dart';

part 'temp_api.g.dart';

@JsonSerializable()
class TempApi {
  @JsonKey(name: 'min')
  final double minTemp;

  @JsonKey(name: 'max')
  final double maxTemp;

  const TempApi({
    required this.minTemp,
    required this.maxTemp,
  });

  factory TempApi.fromJson(Map<String, dynamic> json) =>
      _$TempApiFromJson(json);

  Map<String, dynamic> toJson() => _$TempApiToJson(this);
}
