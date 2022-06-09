import 'package:weather_app/layers/data/models/remote/weather_forecast_api/daily/daily_forecast_api.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/hourly/hourly_forecast_api.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/hourly/weather_forecast_api.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/hourly_forecast.dart';

const skipFirst = 1;

extension MapDailyForecastApiList on List<DailyForecastApi> {
  List<DailyForecast> toDailyForecastList() =>
      map((item) => item.toDailyForecast()).skip(skipFirst).toList();
}

extension MapHourlyForecastApiList on List<HourlyForecastApi> {
  List<HourlyForecast> toHourlyForecastList() =>
      map((item) => item.toHourlyForecast()).toList();
}

extension HourlyForecastExt on List<HourlyForecast> {
  List<HourlyForecast> pickFirstSixHours() => getRange(0, 6).toList();
}

extension PickSixHoursForecast on WeatherForecastApi {
  List<HourlyForecast> pickNextSixHours() {
    List<HourlyForecast> result = [];
    for (var i = 0; i < 6; i++) {
      result.add(hourly[i].toHourlyForecast());
    }
    return result;
  }
}
