import 'package:weather_app/layers/data/local/drift_database/database.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/weather/weather.dart';

extension CurrentWeatherMapper on CurrentWeather {
  CurrentWeatherTableData toTableData() => CurrentWeatherTableData(
        name: name,
        weatherMain: weather.main,
        weatherId: weather.id,
        weatherIcon: weather.icon,
        tempMin: tempMin,
        temp: temp,
        timeStamp: timeStamp,
        feelsLike: feelsLike,
        tempMax: tempMax,
        weatherDescription: weather.description,
      );
}

extension TableDataMapper on CurrentWeatherTableData {
  CurrentWeather toCurrentWeather() => CurrentWeather(
        timeStamp: timeStamp,
        weather: Weather(
          id: weatherId,
          main: weatherMain,
          description: weatherDescription,
          icon: weatherIcon,
        ),
        temp: temp,
        feelsLike: feelsLike,
        tempMin: tempMin,
        tempMax: tempMax,
        name: name,
      );
}
