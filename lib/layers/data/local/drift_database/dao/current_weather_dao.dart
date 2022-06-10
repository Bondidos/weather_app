import 'package:drift/drift.dart';
import 'package:weather_app/layers/data/local/drift_database/dao/extensions/current_weather_ext.dart';
import 'package:weather_app/layers/data/local/drift_database/database.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';

part 'current_weather_dao.g.dart';

@DriftAccessor(tables: [CurrentWeatherTable])
class CurrentWeatherDao extends DatabaseAccessor<Database>
    with _$CurrentWeatherDaoMixin {
  final Database database;

  CurrentWeatherDao(this.database) : super(database);

  Future<void> saveCurrentWeather(CurrentWeather currentWeather) async {
    await _removeOld();
    into(currentWeatherTable)
        .insert(currentWeather.toTableData(), mode: InsertMode.insertOrReplace);
  }

  Future<void> _removeOld() async {
    try {
      final item = await select(currentWeatherTable).getSingle();
      delete(currentWeatherTable).delete(item);
    } catch (e) {
      return;
    }
  }

  Future<CurrentWeather> getSavedCurrentWeather() async {
    final query = select(currentWeatherTable);
    return query.map((tableData) => tableData.toCurrentWeather()).getSingle();
  }
}
