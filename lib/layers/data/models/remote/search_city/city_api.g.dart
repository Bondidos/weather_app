// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityApi _$CityApiFromJson(Map<String, dynamic> json) => CityApi(
      name: json['name'] as String,
      latitude: (json['lat'] as num).toDouble(),
      longitude: (json['lon'] as num).toDouble(),
      country: json['country'] as String,
    );

Map<String, dynamic> _$CityApiToJson(CityApi instance) => <String, dynamic>{
      'name': instance.name,
      'lat': instance.latitude,
      'lon': instance.longitude,
      'country': instance.country,
    };
