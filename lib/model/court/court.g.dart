// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Court _$$_CourtFromJson(Map<String, dynamic> json) => _$_Court(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      photoUrl: json['photoUrl'] as String,
      ticketPrice: (json['ticketPrice'] as num).toDouble(),
      adminIds:
          (json['adminIds'] as List<dynamic>).map((e) => e as String).toList(),
      courtScheds: (json['courtScheds'] as List<dynamic>?)
              ?.map((e) => CourtSched.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      maxPerSlot: json['maxPerSlot'] as int,
      minPerSlot: json['minPerSlot'] as int,
      specialCourtScheds: (json['specialCourtScheds'] as List<dynamic>?)
              ?.map((e) => CourtSched.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CourtToJson(_$_Court instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'photoUrl': instance.photoUrl,
      'ticketPrice': instance.ticketPrice,
      'adminIds': instance.adminIds,
      'courtScheds': instance.courtScheds.map((e) => e.toJson()).toList(),
      'maxPerSlot': instance.maxPerSlot,
      'minPerSlot': instance.minPerSlot,
      'specialCourtScheds':
          instance.specialCourtScheds.map((e) => e.toJson()).toList(),
    };
