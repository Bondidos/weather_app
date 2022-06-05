// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherApi _$CurrentWeatherApiFromJson(Map<String, dynamic> json) =>
    CurrentWeatherApi(
      timeStamp: json['dt'] as int,
      code: json['cod'] as int,
      coordinates:
          CoordinatesApi.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherApi.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: (json['main'] as List<dynamic>)
          .map((e) => WeatherApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentWeatherApiToJson(CurrentWeatherApi instance) =>
    <String, dynamic>{
      'dt': instance.timeStamp,
      'cod': instance.code,
      'coord': instance.coordinates,
      'weather': instance.weather,
      'main': instance.main,
    };
