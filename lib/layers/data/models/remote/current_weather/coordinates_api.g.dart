// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesApi _$CoordinatesApiFromJson(Map<String, dynamic> json) =>
    CoordinatesApi(
      lat: json['lat'] as int,
      lon: json['lon'] as int,
    );

Map<String, dynamic> _$CoordinatesApiToJson(CoordinatesApi instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
