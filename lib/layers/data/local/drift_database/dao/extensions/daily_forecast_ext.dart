import 'package:weather_app/layers/data/local/drift_database/database.dart';
import 'package:weather_app/layers/domain/models/weather/weather.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';

extension DailyForecastMapper on DailyForecast {
  DailyForecastTableData toTableData() => DailyForecastTableData(
        timeStamp: timeStamp,
        minTemp: minTemp,
        maxTemp: maxTemp,
        weatherId: weather.id,
        weatherMain: weather.main,
        weatherDescription: weather.description,
        weatherIcon: weather.icon,
      );
}

extension DailyForecastTableDataMapper on DailyForecastTableData {
  DailyForecast toDailyForecast() => DailyForecast(
        timeStamp: timeStamp,
        minTemp: minTemp,
        maxTemp: maxTemp,
        weather: Weather(
          id: weatherId,
          main: weatherMain,
          description: weatherDescription,
          icon: weatherIcon,
        ),
      );
}
