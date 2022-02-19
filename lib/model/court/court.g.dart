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
      allowedWeekDays: (json['allowedWeekDays'] as List<dynamic>)
          .map((e) => $enumDecode(_$WeekDaysEnumMap, e))
          .toList(),
      allowedTimeSlots: (json['allowedTimeSlots'] as List<dynamic>)
          .map((e) => TimeRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      adminIds:
          (json['adminIds'] as List<dynamic>).map((e) => e as String).toList(),
      nextAvailableSlot: json['nextAvailableSlot'] == null
          ? null
          : CourtSlot.fromJson(
              json['nextAvailableSlot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CourtToJson(_$_Court instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'photoUrl': instance.photoUrl,
      'ticketPrice': instance.ticketPrice,
      'allowedWeekDays':
          instance.allowedWeekDays.map((e) => _$WeekDaysEnumMap[e]).toList(),
      'allowedTimeSlots':
          instance.allowedTimeSlots.map((e) => e.toJson()).toList(),
      'adminIds': instance.adminIds,
      'nextAvailableSlot': instance.nextAvailableSlot?.toJson(),
    };

const _$WeekDaysEnumMap = {
  WeekDays.sunday: 'sunday',
  WeekDays.monday: 'monday',
  WeekDays.tuesday: 'tuesday',
  WeekDays.wednesday: 'wednesday',
  WeekDays.thursday: 'thursday',
  WeekDays.friday: 'friday',
  WeekDays.saturday: 'saturday',
};
