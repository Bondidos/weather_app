import 'package:drift/drift.dart';

class HourlyForecastTable extends Table {
  IntColumn get timeStamp => integer()();

  RealColumn get temp => real()();

  IntColumn get weatherId => integer()();

  TextColumn get weatherMain => text()();

  TextColumn get weatherDescription => text()();

  TextColumn get weatherIcon => text()();

  @override
  Set<Column> get primaryKey => {timeStamp};
}
