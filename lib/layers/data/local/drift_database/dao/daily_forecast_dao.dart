import 'package:drift/drift.dart';
import 'package:weather_app/layers/data/local/drift_database/database.dart';
import 'package:weather_app/layers/domain/models/weather/weather.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';

part 'daily_forecast_dao.g.dart';

@DriftAccessor(tables: [DailyForecastTable])
class DailyForecastDao extends DatabaseAccessor<Database>
    with _$DailyForecastDaoMixin {
  final Database database;

  DailyForecastDao(this.database) : super(database);

  Future<void> saveDailyForeCast(List<DailyForecast> list) async {
    Future.forEach<DailyForecast>(
      list,
          (item) => _saveItem(item.toTableData()),
    );
  }

  Future<void> _saveItem(DailyForecastTableData item) =>
      into(dailyForecastTable).insertOnConflictUpdate(item);

  Future<List<DailyForecast>> getDailyForecastAccordingWithDate(
      int timestamp,
      ) async {
    final query = select(dailyForecastTable)
      ..where((tbl) => tbl.timeStamp.isBiggerThanValue(timestamp));
    return query.map((tableData) => tableData.toDailyForecast()).get();
  }
}

extension DailyForecastMapper on DailyForecast {
  DailyForecastTableData toTableData() =>
      DailyForecastTableData(
        timeStamp: timeStamp,
        minTemp: minTemp,
        maxTemp: maxTemp,
        weatherId: weather.id,
        weatherMain: weather.main,
        weatherDescription: weather.description,
        weatherIcon: weather.icon,
      );
}

extension DailyForecastTableDataMapper on DailyForecastTableData{
  DailyForecast toDailyForecast() =>
      DailyForecast(
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
