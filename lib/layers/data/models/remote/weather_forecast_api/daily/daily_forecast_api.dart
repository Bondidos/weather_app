import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/layers/data/models/remote/weather/weather_api.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/daily/temp_api.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';

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

  DailyForecast toDailyForecast() => DailyForecast(
        timeStamp: timeStamp,
        weather: weather.first.toWeather(),
        maxTemp: temp.maxTemp,
        minTemp: temp.minTemp,
      );
}
