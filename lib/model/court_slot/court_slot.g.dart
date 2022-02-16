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
      startsAt: DateTime.parse(json['startsAt'] as String),
      endsAt: DateTime.parse(json['endsAt'] as String),
    );

Map<String, dynamic> _$$_CourtSlotToJson(_$_CourtSlot instance) =>
    <String, dynamic>{
      'courtId': instance.courtId,
      'players': instance.players.map((e) => e.toJson()).toList(),
      'startsAt': instance.startsAt.toIso8601String(),
      'endsAt': instance.endsAt.toIso8601String(),
    };
