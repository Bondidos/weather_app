import 'package:drift/drift.dart';

class CurrentWeatherTable extends Table {
  IntColumn get timeStamp => integer()();

  TextColumn get name => text()();

  RealColumn get temp => real()();

  RealColumn get feelsLike => real()();

  RealColumn get tempMin => real()();

  RealColumn get tempMax => real()();

  IntColumn get weatherId => integer()();

  TextColumn get weatherMain => text()();

  TextColumn get weatherDescription => text()();

  TextColumn get weatherIcon => text()();

  @override
  Set<Column> get primaryKey => {timeStamp};
}
