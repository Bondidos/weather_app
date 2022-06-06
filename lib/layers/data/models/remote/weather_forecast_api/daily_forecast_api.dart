import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/layers/data/models/remote/weather/weather_api.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/temp_api.dart';

part 'daily_forecast_api.g.dart';

@JsonSerializable()
class DailyForecastApi {
  @JsonKey(name: 'dt')
  final int timeStamp;

  @JsonKey(name: 'temp')
  final TempApi temp;

  @JsonKey(name: 'weather')
  final List<WeatherApi> weather;

  const DailyForecastApi({
    required this.timeStamp,
    required this.weather,
    required this.temp,
  });

  factory DailyForecastApi.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastApiFromJson(json);

  Map<String, dynamic> toJson() => _$DailyForecastApiToJson(this);
}
