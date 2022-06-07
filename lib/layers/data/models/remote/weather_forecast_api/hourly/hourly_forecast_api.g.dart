// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecastApi _$HourlyForecastApiFromJson(Map<String, dynamic> json) =>
    HourlyForecastApi(
      timeStamp: json['dt'] as int,
      temp: (json['temp'] as num).toDouble(),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HourlyForecastApiToJson(HourlyForecastApi instance) =>
    <String, dynamic>{
      'dt': instance.timeStamp,
      'temp': instance.temp,
      'weather': instance.weather,
    };
