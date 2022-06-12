import 'package:weather_app/layers/data/local/drift_database/database.dart';
import 'package:weather_app/layers/domain/models/weather/weather.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/hourly_forecast.dart';

extension HourlyForecastMapper on HourlyForecast {
  HourlyForecastTableData toTableData() => HourlyForecastTableData(
        timeStamp: timeStamp,
        temp: temp,
        weatherId: weather.id,
        weatherMain: weather.main,
        weatherDescription: weather.description,
        weatherIcon: weather.icon,
      );
}

extension HourlyForecastTableDataMapper on HourlyForecastTableData {
  HourlyForecast toHourlyForecast() => HourlyForecast(
        timeStamp: timeStamp,
        temp: temp,
        weather: Weather(
          id: weatherId,
          main: weatherMain,
          description: weatherDescription,
          icon: weatherIcon,
        ),
      );
}
