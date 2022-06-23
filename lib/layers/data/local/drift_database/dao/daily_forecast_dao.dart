import 'package:drift/drift.dart';
import 'package:weather_app/layers/data/local/drift_database/dao/extensions/daily_forecast_ext.dart';
import 'package:weather_app/layers/data/local/drift_database/database.dart';
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
