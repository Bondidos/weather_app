// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempApi _$TempApiFromJson(Map<String, dynamic> json) => TempApi(
      minTemp: (json['min'] as num).toDouble(),
      maxTemp: (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$TempApiToJson(TempApi instance) => <String, dynamic>{
      'min': instance.minTemp,
      'max': instance.maxTemp,
    };
