import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/layers/data/models/remote/weather/weather_api.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/hourly_forecast.dart';

part 'hourly_forecast_api.g.dart';

@JsonSerializable()
class HourlyForecastApi {
  @JsonKey(name: 'dt')
  final int timeStamp;

  @JsonKey(name: 'temp')
  final double temp;

  @JsonKey(name: 'weather')
  final List<WeatherApi> weather;

  const HourlyForecastApi({
    required this.timeStamp,
    required this.temp,
    required this.weather,
  });

  factory HourlyForecastApi.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastApiFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyForecastApiToJson(this);

  HourlyForecast toHourlyForecast() => HourlyForecast(
        timeStamp: timeStamp,
        temp: temp,
        weather: weather.first.toWeather(),
      );
}
