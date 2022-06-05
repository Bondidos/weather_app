// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainApi _$MainApiFromJson(Map<String, dynamic> json) => MainApi(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feelsLike'] as num).toDouble(),
      tempMin: (json['tempMin'] as num).toDouble(),
      tempMax: (json['tempMax'] as num).toDouble(),
    );

Map<String, dynamic> _$MainApiToJson(MainApi instance) => <String, dynamic>{
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
    };
