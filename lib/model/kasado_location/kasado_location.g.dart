// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasado_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KasadoLocation _$$_KasadoLocationFromJson(Map<String, dynamic> json) =>
    _$_KasadoLocation(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$_KasadoLocationToJson(_$_KasadoLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
    };
