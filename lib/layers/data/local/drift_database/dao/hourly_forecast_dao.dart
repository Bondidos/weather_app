import 'package:drift/drift.dart';
import 'package:weather_app/layers/data/local/drift_database/dao/extensions/hourlu_forecast_ext.dart';
import 'package:weather_app/layers/data/local/drift_database/database.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/hourly_forecast.dart';

part 'hourly_forecast_dao.g.dart';

const sevenHoursInSeconds = 21600;

@DriftAccessor(tables: [HourlyForecastTable])
class HourlyForecastDao extends DatabaseAccessor<Database>
    with _$HourlyForecastDaoMixin {
  final Database database;

  HourlyForecastDao(this.database) : super(database);

  Future<void> saveHourlyForecast(List<HourlyForecast> list) async {
    Future.forEach<HourlyForecast>(
      list,
      (item) => _saveItem(item.toTableData()),
    );
  }

  Future<void> _saveItem(HourlyForecastTableData item) =>
      into(hourlyForecastTable).insert(item, mode: InsertMode.insertOrReplace);

  Future<List<HourlyForecast>> getActualSixHoursForecast(int lower) async {
    final higher = lower + sevenHoursInSeconds;
    final query = select(hourlyForecastTable)
      ..where((tbl) => tbl.timeStamp.isBetweenValues(lower, higher));
    return query.map((tableData) => tableData.toHourlyForecast()).get();
  }
}
