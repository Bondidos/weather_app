import 'package:drift/drift.dart';
import 'package:weather_app/layers/data/local/drift_database/database.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/weather/weather.dart';

part 'current_weather_dao.g.dart';

@DriftAccessor(tables: [CurrentWeatherTable])
class CurrentWeatherDao extends DatabaseAccessor<Database>
    with _$CurrentWeatherDaoMixin {
  final Database database;

  CurrentWeatherDao(this.database) : super(database);

  Future<void> saveCurrentWeather(CurrentWeather currentWeather) async {
    into(currentWeatherTable)
        .insert(currentWeather.toTableData(),mode: InsertMode.insertOrReplace);
  }

  Future<CurrentWeather> getSavedCurrentWeather() async {
    final query = select(currentWeatherTable);
    return query.map((tableData) => tableData.toCurrentWeather()).getSingle();
  }
}

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
