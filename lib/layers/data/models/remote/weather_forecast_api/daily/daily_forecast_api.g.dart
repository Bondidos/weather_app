// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecastApi _$DailyForecastApiFromJson(Map<String, dynamic> json) =>
    DailyForecastApi(
      timeStamp: json['dt'] as int,
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherApi.fromJson(e as Map<String, dynamic>))
          .toList(),
      temp: TempApi.fromJson(json['temp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyForecastApiToJson(DailyForecastApi instance) =>
    <String, dynamic>{
      'dt': instance.timeStamp,
      'temp': instance.temp,
      'weather': instance.weather,
    };
