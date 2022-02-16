// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Court _$$_CourtFromJson(Map<String, dynamic> json) => _$_Court(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      ticketPrice: (json['ticketPrice'] as num).toDouble(),
      allowedTimeSlots: (json['allowedTimeSlots'] as List<dynamic>)
          .map((e) => TimeRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextAvailableSlot:
          CourtSlot.fromJson(json['nextAvailableSlot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CourtToJson(_$_Court instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'ticketPrice': instance.ticketPrice,
      'allowedTimeSlots':
          instance.allowedTimeSlots.map((e) => e.toJson()).toList(),
      'nextAvailableSlot': instance.nextAvailableSlot.toJson(),
    };
