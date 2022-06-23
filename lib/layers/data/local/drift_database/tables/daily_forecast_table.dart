import 'package:drift/drift.dart';

class DailyForecastTable extends Table {
  IntColumn get timeStamp => integer()();

  RealColumn get minTemp => real()();

  RealColumn get maxTemp => real()();

  IntColumn get weatherId => integer()();

  TextColumn get weatherMain => text()();

  TextColumn get weatherDescription => text()();

  TextColumn get weatherIcon => text()();

  @override
  Set<Column> get primaryKey => {timeStamp};
}
