// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastApi _$WeatherForecastApiFromJson(Map<String, dynamic> json) =>
    WeatherForecastApi(
      hourly: (json['hourly'] as List<dynamic>)
          .map((e) => HourlyForecastApi.fromJson(e as Map<String, dynamic>))
          .toList(),
      daily: (json['daily'] as List<dynamic>)
          .map((e) => DailyForecastApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherForecastApiToJson(WeatherForecastApi instance) =>
    <String, dynamic>{
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
