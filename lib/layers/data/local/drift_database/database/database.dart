import 'package:drift/drift.dart';
import 'package:weather_app/layers/data/local/drift_database/database.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [CurrentWeatherTable,DailyForecastTable,HourlyForecastTable],
  daos: [CurrentWeatherDao,DailyForecastDao,HourlyForecastDao],
)
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  Database.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;
}
