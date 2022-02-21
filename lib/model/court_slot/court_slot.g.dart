// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourtSlot _$$_CourtSlotFromJson(Map<String, dynamic> json) => _$_CourtSlot(
      courtId: json['courtId'] as String,
      players: (json['players'] as List<dynamic>)
          .map((e) => KasadoUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeRange: TimeRange.fromJson(json['timeRange'] as Map<String, dynamic>),
      isClosedByAdmin: json['isClosedByAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CourtSlotToJson(_$_CourtSlot instance) =>
    <String, dynamic>{
      'courtId': instance.courtId,
      'players': instance.players.map((e) => e.toJson()).toList(),
      'timeRange': instance.timeRange.toJson(),
      'isClosedByAdmin': instance.isClosedByAdmin,
    };
