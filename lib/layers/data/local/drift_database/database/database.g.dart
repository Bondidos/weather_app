// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CurrentWeatherTableData extends DataClass
    implements Insertable<CurrentWeatherTableData> {
  final int timeStamp;
  final String name;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int weatherId;
  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;
  CurrentWeatherTableData(
      {required this.timeStamp,
      required this.name,
      required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.weatherId,
      required this.weatherMain,
      required this.weatherDescription,
      required this.weatherIcon});
  factory CurrentWeatherTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CurrentWeatherTableData(
      timeStamp: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_stamp'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      temp: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}temp'])!,
      feelsLike: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}feels_like'])!,
      tempMin: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}temp_min'])!,
      tempMax: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}temp_max'])!,
      weatherId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weather_id'])!,
      weatherMain: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weather_main'])!,
      weatherDescription: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}weather_description'])!,
      weatherIcon: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weather_icon'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['time_stamp'] = Variable<int>(timeStamp);
    map['name'] = Variable<String>(name);
    map['temp'] = Variable<double>(temp);
    map['feels_like'] = Variable<double>(feelsLike);
    map['temp_min'] = Variable<double>(tempMin);
    map['temp_max'] = Variable<double>(tempMax);
    map['weather_id'] = Variable<int>(weatherId);
    map['weather_main'] = Variable<String>(weatherMain);
    map['weather_description'] = Variable<String>(weatherDescription);
    map['weather_icon'] = Variable<String>(weatherIcon);
    return map;
  }

  CurrentWeatherTableCompanion toCompanion(bool nullToAbsent) {
    return CurrentWeatherTableCompanion(
      timeStamp: Value(timeStamp),
      name: Value(name),
      temp: Value(temp),
      feelsLike: Value(feelsLike),
      tempMin: Value(tempMin),
      tempMax: Value(tempMax),
      weatherId: Value(weatherId),
      weatherMain: Value(weatherMain),
      weatherDescription: Value(weatherDescription),
      weatherIcon: Value(weatherIcon),
    );
  }

  factory CurrentWeatherTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrentWeatherTableData(
      timeStamp: serializer.fromJson<int>(json['timeStamp']),
      name: serializer.fromJson<String>(json['name']),
      temp: serializer.fromJson<double>(json['temp']),
      feelsLike: serializer.fromJson<double>(json['feelsLike']),
      tempMin: serializer.fromJson<double>(json['tempMin']),
      tempMax: serializer.fromJson<double>(json['tempMax']),
      weatherId: serializer.fromJson<int>(json['weatherId']),
      weatherMain: serializer.fromJson<String>(json['weatherMain']),
      weatherDescription:
          serializer.fromJson<String>(json['weatherDescription']),
      weatherIcon: serializer.fromJson<String>(json['weatherIcon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'timeStamp': serializer.toJson<int>(timeStamp),
      'name': serializer.toJson<String>(name),
      'temp': serializer.toJson<double>(temp),
      'feelsLike': serializer.toJson<double>(feelsLike),
      'tempMin': serializer.toJson<double>(tempMin),
      'tempMax': serializer.toJson<double>(tempMax),
      'weatherId': serializer.toJson<int>(weatherId),
      'weatherMain': serializer.toJson<String>(weatherMain),
      'weatherDescription': serializer.toJson<String>(weatherDescription),
      'weatherIcon': serializer.toJson<String>(weatherIcon),
    };
  }

  CurrentWeatherTableData copyWith(
          {int? timeStamp,
          String? name,
          double? temp,
          double? feelsLike,
          double? tempMin,
          double? tempMax,
          int? weatherId,
          String? weatherMain,
          String? weatherDescription,
          String? weatherIcon}) =>
      CurrentWeatherTableData(
        timeStamp: timeStamp ?? this.timeStamp,
        name: name ?? this.name,
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        weatherId: weatherId ?? this.weatherId,
        weatherMain: weatherMain ?? this.weatherMain,
        weatherDescription: weatherDescription ?? this.weatherDescription,
        weatherIcon: weatherIcon ?? this.weatherIcon,
      );
  @override
  String toString() {
    return (StringBuffer('CurrentWeatherTableData(')
          ..write('timeStamp: $timeStamp, ')
          ..write('name: $name, ')
          ..write('temp: $temp, ')
          ..write('feelsLike: $feelsLike, ')
          ..write('tempMin: $tempMin, ')
          ..write('tempMax: $tempMax, ')
          ..write('weatherId: $weatherId, ')
          ..write('weatherMain: $weatherMain, ')
          ..write('weatherDescription: $weatherDescription, ')
          ..write('weatherIcon: $weatherIcon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(timeStamp, name, temp, feelsLike, tempMin,
      tempMax, weatherId, weatherMain, weatherDescription, weatherIcon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrentWeatherTableData &&
          other.timeStamp == this.timeStamp &&
          other.name == this.name &&
          other.temp == this.temp &&
          other.feelsLike == this.feelsLike &&
          other.tempMin == this.tempMin &&
          other.tempMax == this.tempMax &&
          other.weatherId == this.weatherId &&
          other.weatherMain == this.weatherMain &&
          other.weatherDescription == this.weatherDescription &&
          other.weatherIcon == this.weatherIcon);
}

class CurrentWeatherTableCompanion
    extends UpdateCompanion<CurrentWeatherTableData> {
  final Value<int> timeStamp;
  final Value<String> name;
  final Value<double> temp;
  final Value<double> feelsLike;
  final Value<double> tempMin;
  final Value<double> tempMax;
  final Value<int> weatherId;
  final Value<String> weatherMain;
  final Value<String> weatherDescription;
  final Value<String> weatherIcon;
  const CurrentWeatherTableCompanion({
    this.timeStamp = const Value.absent(),
    this.name = const Value.absent(),
    this.temp = const Value.absent(),
    this.feelsLike = const Value.absent(),
    this.tempMin = const Value.absent(),
    this.tempMax = const Value.absent(),
    this.weatherId = const Value.absent(),
    this.weatherMain = const Value.absent(),
    this.weatherDescription = const Value.absent(),
    this.weatherIcon = const Value.absent(),
  });
  CurrentWeatherTableCompanion.insert({
    this.timeStamp = const Value.absent(),
    required String name,
    required double temp,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required int weatherId,
    required String weatherMain,
    required String weatherDescription,
    required String weatherIcon,
  })  : name = Value(name),
        temp = Value(temp),
        feelsLike = Value(feelsLike),
        tempMin = Value(tempMin),
        tempMax = Value(tempMax),
        weatherId = Value(weatherId),
        weatherMain = Value(weatherMain),
        weatherDescription = Value(weatherDescription),
        weatherIcon = Value(weatherIcon);
  static Insertable<CurrentWeatherTableData> custom({
    Expression<int>? timeStamp,
    Expression<String>? name,
    Expression<double>? temp,
    Expression<double>? feelsLike,
    Expression<double>? tempMin,
    Expression<double>? tempMax,
    Expression<int>? weatherId,
    Expression<String>? weatherMain,
    Expression<String>? weatherDescription,
    Expression<String>? weatherIcon,
  }) {
    return RawValuesInsertable({
      if (timeStamp != null) 'time_stamp': timeStamp,
      if (name != null) 'name': name,
      if (temp != null) 'temp': temp,
      if (feelsLike != null) 'feels_like': feelsLike,
      if (tempMin != null) 'temp_min': tempMin,
      if (tempMax != null) 'temp_max': tempMax,
      if (weatherId != null) 'weather_id': weatherId,
      if (weatherMain != null) 'weather_main': weatherMain,
      if (weatherDescription != null) 'weather_description': weatherDescription,
      if (weatherIcon != null) 'weather_icon': weatherIcon,
    });
  }

  CurrentWeatherTableCompanion copyWith(
      {Value<int>? timeStamp,
      Value<String>? name,
      Value<double>? temp,
      Value<double>? feelsLike,
      Value<double>? tempMin,
      Value<double>? tempMax,
      Value<int>? weatherId,
      Value<String>? weatherMain,
      Value<String>? weatherDescription,
      Value<String>? weatherIcon}) {
    return CurrentWeatherTableCompanion(
      timeStamp: timeStamp ?? this.timeStamp,
      name: name ?? this.name,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      weatherId: weatherId ?? this.weatherId,
      weatherMain: weatherMain ?? this.weatherMain,
      weatherDescription: weatherDescription ?? this.weatherDescription,
      weatherIcon: weatherIcon ?? this.weatherIcon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (timeStamp.present) {
      map['time_stamp'] = Variable<int>(timeStamp.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (temp.present) {
      map['temp'] = Variable<double>(temp.value);
    }
    if (feelsLike.present) {
      map['feels_like'] = Variable<double>(feelsLike.value);
    }
    if (tempMin.present) {
      map['temp_min'] = Variable<double>(tempMin.value);
    }
    if (tempMax.present) {
      map['temp_max'] = Variable<double>(tempMax.value);
    }
    if (weatherId.present) {
      map['weather_id'] = Variable<int>(weatherId.value);
    }
    if (weatherMain.present) {
      map['weather_main'] = Variable<String>(weatherMain.value);
    }
    if (weatherDescription.present) {
      map['weather_description'] = Variable<String>(weatherDescription.value);
    }
    if (weatherIcon.present) {
      map['weather_icon'] = Variable<String>(weatherIcon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrentWeatherTableCompanion(')
          ..write('timeStamp: $timeStamp, ')
          ..write('name: $name, ')
          ..write('temp: $temp, ')
          ..write('feelsLike: $feelsLike, ')
          ..write('tempMin: $tempMin, ')
          ..write('tempMax: $tempMax, ')
          ..write('weatherId: $weatherId, ')
          ..write('weatherMain: $weatherMain, ')
          ..write('weatherDescription: $weatherDescription, ')
          ..write('weatherIcon: $weatherIcon')
          ..write(')'))
        .toString();
  }
}

class $CurrentWeatherTableTable extends CurrentWeatherTable
    with TableInfo<$CurrentWeatherTableTable, CurrentWeatherTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrentWeatherTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _timeStampMeta = const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<int?> timeStamp = GeneratedColumn<int?>(
      'time_stamp', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _tempMeta = const VerificationMeta('temp');
  @override
  late final GeneratedColumn<double?> temp = GeneratedColumn<double?>(
      'temp', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _feelsLikeMeta = const VerificationMeta('feelsLike');
  @override
  late final GeneratedColumn<double?> feelsLike = GeneratedColumn<double?>(
      'feels_like', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _tempMinMeta = const VerificationMeta('tempMin');
  @override
  late final GeneratedColumn<double?> tempMin = GeneratedColumn<double?>(
      'temp_min', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _tempMaxMeta = const VerificationMeta('tempMax');
  @override
  late final GeneratedColumn<double?> tempMax = GeneratedColumn<double?>(
      'temp_max', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _weatherIdMeta = const VerificationMeta('weatherId');
  @override
  late final GeneratedColumn<int?> weatherId = GeneratedColumn<int?>(
      'weather_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _weatherMainMeta =
      const VerificationMeta('weatherMain');
  @override
  late final GeneratedColumn<String?> weatherMain = GeneratedColumn<String?>(
      'weather_main', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _weatherDescriptionMeta =
      const VerificationMeta('weatherDescription');
  @override
  late final GeneratedColumn<String?> weatherDescription =
      GeneratedColumn<String?>('weather_description', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _weatherIconMeta =
      const VerificationMeta('weatherIcon');
  @override
  late final GeneratedColumn<String?> weatherIcon = GeneratedColumn<String?>(
      'weather_icon', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        timeStamp,
        name,
        temp,
        feelsLike,
        tempMin,
        tempMax,
        weatherId,
        weatherMain,
        weatherDescription,
        weatherIcon
      ];
  @override
  String get aliasedName => _alias ?? 'current_weather_table';
  @override
  String get actualTableName => 'current_weather_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CurrentWeatherTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('time_stamp')) {
      context.handle(_timeStampMeta,
          timeStamp.isAcceptableOrUnknown(data['time_stamp']!, _timeStampMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('temp')) {
      context.handle(
          _tempMeta, temp.isAcceptableOrUnknown(data['temp']!, _tempMeta));
    } else if (isInserting) {
      context.missing(_tempMeta);
    }
    if (data.containsKey('feels_like')) {
      context.handle(_feelsLikeMeta,
          feelsLike.isAcceptableOrUnknown(data['feels_like']!, _feelsLikeMeta));
    } else if (isInserting) {
      context.missing(_feelsLikeMeta);
    }
    if (data.containsKey('temp_min')) {
      context.handle(_tempMinMeta,
          tempMin.isAcceptableOrUnknown(data['temp_min']!, _tempMinMeta));
    } else if (isInserting) {
      context.missing(_tempMinMeta);
    }
    if (data.containsKey('temp_max')) {
      context.handle(_tempMaxMeta,
          tempMax.isAcceptableOrUnknown(data['temp_max']!, _tempMaxMeta));
    } else if (isInserting) {
      context.missing(_tempMaxMeta);
    }
    if (data.containsKey('weather_id')) {
      context.handle(_weatherIdMeta,
          weatherId.isAcceptableOrUnknown(data['weather_id']!, _weatherIdMeta));
    } else if (isInserting) {
      context.missing(_weatherIdMeta);
    }
    if (data.containsKey('weather_main')) {
      context.handle(
          _weatherMainMeta,
          weatherMain.isAcceptableOrUnknown(
              data['weather_main']!, _weatherMainMeta));
    } else if (isInserting) {
      context.missing(_weatherMainMeta);
    }
    if (data.containsKey('weather_description')) {
      context.handle(
          _weatherDescriptionMeta,
          weatherDescription.isAcceptableOrUnknown(
              data['weather_description']!, _weatherDescriptionMeta));
    } else if (isInserting) {
      context.missing(_weatherDescriptionMeta);
    }
    if (data.containsKey('weather_icon')) {
      context.handle(
          _weatherIconMeta,
          weatherIcon.isAcceptableOrUnknown(
              data['weather_icon']!, _weatherIconMeta));
    } else if (isInserting) {
      context.missing(_weatherIconMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {timeStamp};
  @override
  CurrentWeatherTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return CurrentWeatherTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CurrentWeatherTableTable createAlias(String alias) {
    return $CurrentWeatherTableTable(attachedDatabase, alias);
  }
}

class DailyForecastTableData extends DataClass
    implements Insertable<DailyForecastTableData> {
  final int timeStamp;
  final double minTemp;
  final double maxTemp;
  final int weatherId;
  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;
  DailyForecastTableData(
      {required this.timeStamp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherId,
      required this.weatherMain,
      required this.weatherDescription,
      required this.weatherIcon});
  factory DailyForecastTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DailyForecastTableData(
      timeStamp: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_stamp'])!,
      minTemp: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}min_temp'])!,
      maxTemp: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}max_temp'])!,
      weatherId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weather_id'])!,
      weatherMain: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weather_main'])!,
      weatherDescription: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}weather_description'])!,
      weatherIcon: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weather_icon'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['time_stamp'] = Variable<int>(timeStamp);
    map['min_temp'] = Variable<double>(minTemp);
    map['max_temp'] = Variable<double>(maxTemp);
    map['weather_id'] = Variable<int>(weatherId);
    map['weather_main'] = Variable<String>(weatherMain);
    map['weather_description'] = Variable<String>(weatherDescription);
    map['weather_icon'] = Variable<String>(weatherIcon);
    return map;
  }

  DailyForecastTableCompanion toCompanion(bool nullToAbsent) {
    return DailyForecastTableCompanion(
      timeStamp: Value(timeStamp),
      minTemp: Value(minTemp),
      maxTemp: Value(maxTemp),
      weatherId: Value(weatherId),
      weatherMain: Value(weatherMain),
      weatherDescription: Value(weatherDescription),
      weatherIcon: Value(weatherIcon),
    );
  }

  factory DailyForecastTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyForecastTableData(
      timeStamp: serializer.fromJson<int>(json['timeStamp']),
      minTemp: serializer.fromJson<double>(json['minTemp']),
      maxTemp: serializer.fromJson<double>(json['maxTemp']),
      weatherId: serializer.fromJson<int>(json['weatherId']),
      weatherMain: serializer.fromJson<String>(json['weatherMain']),
      weatherDescription:
          serializer.fromJson<String>(json['weatherDescription']),
      weatherIcon: serializer.fromJson<String>(json['weatherIcon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'timeStamp': serializer.toJson<int>(timeStamp),
      'minTemp': serializer.toJson<double>(minTemp),
      'maxTemp': serializer.toJson<double>(maxTemp),
      'weatherId': serializer.toJson<int>(weatherId),
      'weatherMain': serializer.toJson<String>(weatherMain),
      'weatherDescription': serializer.toJson<String>(weatherDescription),
      'weatherIcon': serializer.toJson<String>(weatherIcon),
    };
  }

  DailyForecastTableData copyWith(
          {int? timeStamp,
          double? minTemp,
          double? maxTemp,
          int? weatherId,
          String? weatherMain,
          String? weatherDescription,
          String? weatherIcon}) =>
      DailyForecastTableData(
        timeStamp: timeStamp ?? this.timeStamp,
        minTemp: minTemp ?? this.minTemp,
        maxTemp: maxTemp ?? this.maxTemp,
        weatherId: weatherId ?? this.weatherId,
        weatherMain: weatherMain ?? this.weatherMain,
        weatherDescription: weatherDescription ?? this.weatherDescription,
        weatherIcon: weatherIcon ?? this.weatherIcon,
      );
  @override
  String toString() {
    return (StringBuffer('DailyForecastTableData(')
          ..write('timeStamp: $timeStamp, ')
          ..write('minTemp: $minTemp, ')
          ..write('maxTemp: $maxTemp, ')
          ..write('weatherId: $weatherId, ')
          ..write('weatherMain: $weatherMain, ')
          ..write('weatherDescription: $weatherDescription, ')
          ..write('weatherIcon: $weatherIcon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(timeStamp, minTemp, maxTemp, weatherId,
      weatherMain, weatherDescription, weatherIcon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyForecastTableData &&
          other.timeStamp == this.timeStamp &&
          other.minTemp == this.minTemp &&
          other.maxTemp == this.maxTemp &&
          other.weatherId == this.weatherId &&
          other.weatherMain == this.weatherMain &&
          other.weatherDescription == this.weatherDescription &&
          other.weatherIcon == this.weatherIcon);
}

class DailyForecastTableCompanion
    extends UpdateCompanion<DailyForecastTableData> {
  final Value<int> timeStamp;
  final Value<double> minTemp;
  final Value<double> maxTemp;
  final Value<int> weatherId;
  final Value<String> weatherMain;
  final Value<String> weatherDescription;
  final Value<String> weatherIcon;
  const DailyForecastTableCompanion({
    this.timeStamp = const Value.absent(),
    this.minTemp = const Value.absent(),
    this.maxTemp = const Value.absent(),
    this.weatherId = const Value.absent(),
    this.weatherMain = const Value.absent(),
    this.weatherDescription = const Value.absent(),
    this.weatherIcon = const Value.absent(),
  });
  DailyForecastTableCompanion.insert({
    this.timeStamp = const Value.absent(),
    required double minTemp,
    required double maxTemp,
    required int weatherId,
    required String weatherMain,
    required String weatherDescription,
    required String weatherIcon,
  })  : minTemp = Value(minTemp),
        maxTemp = Value(maxTemp),
        weatherId = Value(weatherId),
        weatherMain = Value(weatherMain),
        weatherDescription = Value(weatherDescription),
        weatherIcon = Value(weatherIcon);
  static Insertable<DailyForecastTableData> custom({
    Expression<int>? timeStamp,
    Expression<double>? minTemp,
    Expression<double>? maxTemp,
    Expression<int>? weatherId,
    Expression<String>? weatherMain,
    Expression<String>? weatherDescription,
    Expression<String>? weatherIcon,
  }) {
    return RawValuesInsertable({
      if (timeStamp != null) 'time_stamp': timeStamp,
      if (minTemp != null) 'min_temp': minTemp,
      if (maxTemp != null) 'max_temp': maxTemp,
      if (weatherId != null) 'weather_id': weatherId,
      if (weatherMain != null) 'weather_main': weatherMain,
      if (weatherDescription != null) 'weather_description': weatherDescription,
      if (weatherIcon != null) 'weather_icon': weatherIcon,
    });
  }

  DailyForecastTableCompanion copyWith(
      {Value<int>? timeStamp,
      Value<double>? minTemp,
      Value<double>? maxTemp,
      Value<int>? weatherId,
      Value<String>? weatherMain,
      Value<String>? weatherDescription,
      Value<String>? weatherIcon}) {
    return DailyForecastTableCompanion(
      timeStamp: timeStamp ?? this.timeStamp,
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      weatherId: weatherId ?? this.weatherId,
      weatherMain: weatherMain ?? this.weatherMain,
      weatherDescription: weatherDescription ?? this.weatherDescription,
      weatherIcon: weatherIcon ?? this.weatherIcon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (timeStamp.present) {
      map['time_stamp'] = Variable<int>(timeStamp.value);
    }
    if (minTemp.present) {
      map['min_temp'] = Variable<double>(minTemp.value);
    }
    if (maxTemp.present) {
      map['max_temp'] = Variable<double>(maxTemp.value);
    }
    if (weatherId.present) {
      map['weather_id'] = Variable<int>(weatherId.value);
    }
    if (weatherMain.present) {
      map['weather_main'] = Variable<String>(weatherMain.value);
    }
    if (weatherDescription.present) {
      map['weather_description'] = Variable<String>(weatherDescription.value);
    }
    if (weatherIcon.present) {
      map['weather_icon'] = Variable<String>(weatherIcon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyForecastTableCompanion(')
          ..write('timeStamp: $timeStamp, ')
          ..write('minTemp: $minTemp, ')
          ..write('maxTemp: $maxTemp, ')
          ..write('weatherId: $weatherId, ')
          ..write('weatherMain: $weatherMain, ')
          ..write('weatherDescription: $weatherDescription, ')
          ..write('weatherIcon: $weatherIcon')
          ..write(')'))
        .toString();
  }
}

class $DailyForecastTableTable extends DailyForecastTable
    with TableInfo<$DailyForecastTableTable, DailyForecastTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyForecastTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _timeStampMeta = const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<int?> timeStamp = GeneratedColumn<int?>(
      'time_stamp', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _minTempMeta = const VerificationMeta('minTemp');
  @override
  late final GeneratedColumn<double?> minTemp = GeneratedColumn<double?>(
      'min_temp', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _maxTempMeta = const VerificationMeta('maxTemp');
  @override
  late final GeneratedColumn<double?> maxTemp = GeneratedColumn<double?>(
      'max_temp', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _weatherIdMeta = const VerificationMeta('weatherId');
  @override
  late final GeneratedColumn<int?> weatherId = GeneratedColumn<int?>(
      'weather_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _weatherMainMeta =
      const VerificationMeta('weatherMain');
  @override
  late final GeneratedColumn<String?> weatherMain = GeneratedColumn<String?>(
      'weather_main', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _weatherDescriptionMeta =
      const VerificationMeta('weatherDescription');
  @override
  late final GeneratedColumn<String?> weatherDescription =
      GeneratedColumn<String?>('weather_description', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _weatherIconMeta =
      const VerificationMeta('weatherIcon');
  @override
  late final GeneratedColumn<String?> weatherIcon = GeneratedColumn<String?>(
      'weather_icon', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        timeStamp,
        minTemp,
        maxTemp,
        weatherId,
        weatherMain,
        weatherDescription,
        weatherIcon
      ];
  @override
  String get aliasedName => _alias ?? 'daily_forecast_table';
  @override
  String get actualTableName => 'daily_forecast_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DailyForecastTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('time_stamp')) {
      context.handle(_timeStampMeta,
          timeStamp.isAcceptableOrUnknown(data['time_stamp']!, _timeStampMeta));
    }
    if (data.containsKey('min_temp')) {
      context.handle(_minTempMeta,
          minTemp.isAcceptableOrUnknown(data['min_temp']!, _minTempMeta));
    } else if (isInserting) {
      context.missing(_minTempMeta);
    }
    if (data.containsKey('max_temp')) {
      context.handle(_maxTempMeta,
          maxTemp.isAcceptableOrUnknown(data['max_temp']!, _maxTempMeta));
    } else if (isInserting) {
      context.missing(_maxTempMeta);
    }
    if (data.containsKey('weather_id')) {
      context.handle(_weatherIdMeta,
          weatherId.isAcceptableOrUnknown(data['weather_id']!, _weatherIdMeta));
    } else if (isInserting) {
      context.missing(_weatherIdMeta);
    }
    if (data.containsKey('weather_main')) {
      context.handle(
          _weatherMainMeta,
          weatherMain.isAcceptableOrUnknown(
              data['weather_main']!, _weatherMainMeta));
    } else if (isInserting) {
      context.missing(_weatherMainMeta);
    }
    if (data.containsKey('weather_description')) {
      context.handle(
          _weatherDescriptionMeta,
          weatherDescription.isAcceptableOrUnknown(
              data['weather_description']!, _weatherDescriptionMeta));
    } else if (isInserting) {
      context.missing(_weatherDescriptionMeta);
    }
    if (data.containsKey('weather_icon')) {
      context.handle(
          _weatherIconMeta,
          weatherIcon.isAcceptableOrUnknown(
              data['weather_icon']!, _weatherIconMeta));
    } else if (isInserting) {
      context.missing(_weatherIconMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {timeStamp};
  @override
  DailyForecastTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DailyForecastTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DailyForecastTableTable createAlias(String alias) {
    return $DailyForecastTableTable(attachedDatabase, alias);
  }
}

class HourlyForecastTableData extends DataClass
    implements Insertable<HourlyForecastTableData> {
  final int timeStamp;
  final double temp;
  final int weatherId;
  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;
  HourlyForecastTableData(
      {required this.timeStamp,
      required this.temp,
      required this.weatherId,
      required this.weatherMain,
      required this.weatherDescription,
      required this.weatherIcon});
  factory HourlyForecastTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HourlyForecastTableData(
      timeStamp: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_stamp'])!,
      temp: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}temp'])!,
      weatherId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weather_id'])!,
      weatherMain: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weather_main'])!,
      weatherDescription: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}weather_description'])!,
      weatherIcon: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weather_icon'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['time_stamp'] = Variable<int>(timeStamp);
    map['temp'] = Variable<double>(temp);
    map['weather_id'] = Variable<int>(weatherId);
    map['weather_main'] = Variable<String>(weatherMain);
    map['weather_description'] = Variable<String>(weatherDescription);
    map['weather_icon'] = Variable<String>(weatherIcon);
    return map;
  }

  HourlyForecastTableCompanion toCompanion(bool nullToAbsent) {
    return HourlyForecastTableCompanion(
      timeStamp: Value(timeStamp),
      temp: Value(temp),
      weatherId: Value(weatherId),
      weatherMain: Value(weatherMain),
      weatherDescription: Value(weatherDescription),
      weatherIcon: Value(weatherIcon),
    );
  }

  factory HourlyForecastTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HourlyForecastTableData(
      timeStamp: serializer.fromJson<int>(json['timeStamp']),
      temp: serializer.fromJson<double>(json['temp']),
      weatherId: serializer.fromJson<int>(json['weatherId']),
      weatherMain: serializer.fromJson<String>(json['weatherMain']),
      weatherDescription:
          serializer.fromJson<String>(json['weatherDescription']),
      weatherIcon: serializer.fromJson<String>(json['weatherIcon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'timeStamp': serializer.toJson<int>(timeStamp),
      'temp': serializer.toJson<double>(temp),
      'weatherId': serializer.toJson<int>(weatherId),
      'weatherMain': serializer.toJson<String>(weatherMain),
      'weatherDescription': serializer.toJson<String>(weatherDescription),
      'weatherIcon': serializer.toJson<String>(weatherIcon),
    };
  }

  HourlyForecastTableData copyWith(
          {int? timeStamp,
          double? temp,
          int? weatherId,
          String? weatherMain,
          String? weatherDescription,
          String? weatherIcon}) =>
      HourlyForecastTableData(
        timeStamp: timeStamp ?? this.timeStamp,
        temp: temp ?? this.temp,
        weatherId: weatherId ?? this.weatherId,
        weatherMain: weatherMain ?? this.weatherMain,
        weatherDescription: weatherDescription ?? this.weatherDescription,
        weatherIcon: weatherIcon ?? this.weatherIcon,
      );
  @override
  String toString() {
    return (StringBuffer('HourlyForecastTableData(')
          ..write('timeStamp: $timeStamp, ')
          ..write('temp: $temp, ')
          ..write('weatherId: $weatherId, ')
          ..write('weatherMain: $weatherMain, ')
          ..write('weatherDescription: $weatherDescription, ')
          ..write('weatherIcon: $weatherIcon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      timeStamp, temp, weatherId, weatherMain, weatherDescription, weatherIcon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HourlyForecastTableData &&
          other.timeStamp == this.timeStamp &&
          other.temp == this.temp &&
          other.weatherId == this.weatherId &&
          other.weatherMain == this.weatherMain &&
          other.weatherDescription == this.weatherDescription &&
          other.weatherIcon == this.weatherIcon);
}

class HourlyForecastTableCompanion
    extends UpdateCompanion<HourlyForecastTableData> {
  final Value<int> timeStamp;
  final Value<double> temp;
  final Value<int> weatherId;
  final Value<String> weatherMain;
  final Value<String> weatherDescription;
  final Value<String> weatherIcon;
  const HourlyForecastTableCompanion({
    this.timeStamp = const Value.absent(),
    this.temp = const Value.absent(),
    this.weatherId = const Value.absent(),
    this.weatherMain = const Value.absent(),
    this.weatherDescription = const Value.absent(),
    this.weatherIcon = const Value.absent(),
  });
  HourlyForecastTableCompanion.insert({
    this.timeStamp = const Value.absent(),
    required double temp,
    required int weatherId,
    required String weatherMain,
    required String weatherDescription,
    required String weatherIcon,
  })  : temp = Value(temp),
        weatherId = Value(weatherId),
        weatherMain = Value(weatherMain),
        weatherDescription = Value(weatherDescription),
        weatherIcon = Value(weatherIcon);
  static Insertable<HourlyForecastTableData> custom({
    Expression<int>? timeStamp,
    Expression<double>? temp,
    Expression<int>? weatherId,
    Expression<String>? weatherMain,
    Expression<String>? weatherDescription,
    Expression<String>? weatherIcon,
  }) {
    return RawValuesInsertable({
      if (timeStamp != null) 'time_stamp': timeStamp,
      if (temp != null) 'temp': temp,
      if (weatherId != null) 'weather_id': weatherId,
      if (weatherMain != null) 'weather_main': weatherMain,
      if (weatherDescription != null) 'weather_description': weatherDescription,
      if (weatherIcon != null) 'weather_icon': weatherIcon,
    });
  }

  HourlyForecastTableCompanion copyWith(
      {Value<int>? timeStamp,
      Value<double>? temp,
      Value<int>? weatherId,
      Value<String>? weatherMain,
      Value<String>? weatherDescription,
      Value<String>? weatherIcon}) {
    return HourlyForecastTableCompanion(
      timeStamp: timeStamp ?? this.timeStamp,
      temp: temp ?? this.temp,
      weatherId: weatherId ?? this.weatherId,
      weatherMain: weatherMain ?? this.weatherMain,
      weatherDescription: weatherDescription ?? this.weatherDescription,
      weatherIcon: weatherIcon ?? this.weatherIcon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (timeStamp.present) {
      map['time_stamp'] = Variable<int>(timeStamp.value);
    }
    if (temp.present) {
      map['temp'] = Variable<double>(temp.value);
    }
    if (weatherId.present) {
      map['weather_id'] = Variable<int>(weatherId.value);
    }
    if (weatherMain.present) {
      map['weather_main'] = Variable<String>(weatherMain.value);
    }
    if (weatherDescription.present) {
      map['weather_description'] = Variable<String>(weatherDescription.value);
    }
    if (weatherIcon.present) {
      map['weather_icon'] = Variable<String>(weatherIcon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HourlyForecastTableCompanion(')
          ..write('timeStamp: $timeStamp, ')
          ..write('temp: $temp, ')
          ..write('weatherId: $weatherId, ')
          ..write('weatherMain: $weatherMain, ')
          ..write('weatherDescription: $weatherDescription, ')
          ..write('weatherIcon: $weatherIcon')
          ..write(')'))
        .toString();
  }
}

class $HourlyForecastTableTable extends HourlyForecastTable
    with TableInfo<$HourlyForecastTableTable, HourlyForecastTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HourlyForecastTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _timeStampMeta = const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<int?> timeStamp = GeneratedColumn<int?>(
      'time_stamp', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _tempMeta = const VerificationMeta('temp');
  @override
  late final GeneratedColumn<double?> temp = GeneratedColumn<double?>(
      'temp', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _weatherIdMeta = const VerificationMeta('weatherId');
  @override
  late final GeneratedColumn<int?> weatherId = GeneratedColumn<int?>(
      'weather_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _weatherMainMeta =
      const VerificationMeta('weatherMain');
  @override
  late final GeneratedColumn<String?> weatherMain = GeneratedColumn<String?>(
      'weather_main', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _weatherDescriptionMeta =
      const VerificationMeta('weatherDescription');
  @override
  late final GeneratedColumn<String?> weatherDescription =
      GeneratedColumn<String?>('weather_description', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _weatherIconMeta =
      const VerificationMeta('weatherIcon');
  @override
  late final GeneratedColumn<String?> weatherIcon = GeneratedColumn<String?>(
      'weather_icon', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        timeStamp,
        temp,
        weatherId,
        weatherMain,
        weatherDescription,
        weatherIcon
      ];
  @override
  String get aliasedName => _alias ?? 'hourly_forecast_table';
  @override
  String get actualTableName => 'hourly_forecast_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<HourlyForecastTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('time_stamp')) {
      context.handle(_timeStampMeta,
          timeStamp.isAcceptableOrUnknown(data['time_stamp']!, _timeStampMeta));
    }
    if (data.containsKey('temp')) {
      context.handle(
          _tempMeta, temp.isAcceptableOrUnknown(data['temp']!, _tempMeta));
    } else if (isInserting) {
      context.missing(_tempMeta);
    }
    if (data.containsKey('weather_id')) {
      context.handle(_weatherIdMeta,
          weatherId.isAcceptableOrUnknown(data['weather_id']!, _weatherIdMeta));
    } else if (isInserting) {
      context.missing(_weatherIdMeta);
    }
    if (data.containsKey('weather_main')) {
      context.handle(
          _weatherMainMeta,
          weatherMain.isAcceptableOrUnknown(
              data['weather_main']!, _weatherMainMeta));
    } else if (isInserting) {
      context.missing(_weatherMainMeta);
    }
    if (data.containsKey('weather_description')) {
      context.handle(
          _weatherDescriptionMeta,
          weatherDescription.isAcceptableOrUnknown(
              data['weather_description']!, _weatherDescriptionMeta));
    } else if (isInserting) {
      context.missing(_weatherDescriptionMeta);
    }
    if (data.containsKey('weather_icon')) {
      context.handle(
          _weatherIconMeta,
          weatherIcon.isAcceptableOrUnknown(
              data['weather_icon']!, _weatherIconMeta));
    } else if (isInserting) {
      context.missing(_weatherIconMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {timeStamp};
  @override
  HourlyForecastTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return HourlyForecastTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HourlyForecastTableTable createAlias(String alias) {
    return $HourlyForecastTableTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$Database.connect(DatabaseConnection c) : super.connect(c);
  late final $CurrentWeatherTableTable currentWeatherTable =
      $CurrentWeatherTableTable(this);
  late final $DailyForecastTableTable dailyForecastTable =
      $DailyForecastTableTable(this);
  late final $HourlyForecastTableTable hourlyForecastTable =
      $HourlyForecastTableTable(this);
  late final CurrentWeatherDao currentWeatherDao =
      CurrentWeatherDao(this as Database);
  late final DailyForecastDao dailyForecastDao =
      DailyForecastDao(this as Database);
  late final HourlyForecastDao hourlyForecastDao =
      HourlyForecastDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [currentWeatherTable, dailyForecastTable, hourlyForecastTable];
}
