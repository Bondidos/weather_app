import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/daily/daily_forecast_api.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/hourly/hourly_forecast_api.dart';

part 'weather_forecast_api.g.dart';

@JsonSerializable()
class WeatherForecastApi {
  @JsonKey(name: 'hourly')
  final List<HourlyForecastApi> hourly;

  @JsonKey(name: 'daily')
  final List<DailyForecastApi> daily;

  const WeatherForecastApi({
    required this.hourly,
    required this.daily,
  });

  factory WeatherForecastApi.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastApiFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastApiToJson(this);
}

