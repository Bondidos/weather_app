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
      main: MainApi.fromJson(json['main'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CurrentWeatherApiToJson(CurrentWeatherApi instance) =>
    <String, dynamic>{
      'dt': instance.timeStamp,
      'cod': instance.code,
      'name': instance.name,
      'coord': instance.coordinates,
      'weather': instance.weather,
      'main': instance.main,
    };
