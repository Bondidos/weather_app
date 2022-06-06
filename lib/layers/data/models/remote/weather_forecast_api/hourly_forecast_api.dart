import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/layers/data/models/remote/weather/weather_api.dart';
import 'package:weather_app/layers/domain/models/hourly_weather_forecast/hourly_forecast.dart';

part 'hourly_forecast_api.g.dart';

@JsonSerializable()
class HourlyForecastApi {
  @JsonKey(name: 'dt')
  final int timeStamp;

  @JsonKey(name: 'weather')
  final List<WeatherApi> weather;

  const HourlyForecastApi({
    required this.timeStamp,
    required this.weather,
  });

  factory HourlyForecastApi.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastApiFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyForecastApiToJson(this);

  HourlyForecast toHourlyForecast() => HourlyForecast(
        timeStamp: timeStamp,
        weather: weather.map((item) => item.toWeather()).toList(),
      );
}
