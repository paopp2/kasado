// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourtSlot _$$_CourtSlotFromJson(Map<String, dynamic> json) => _$_CourtSlot(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      players: (json['players'] as List<dynamic>)
          .map((e) => KasadoUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      ticketPrice: (json['ticketPrice'] as num).toDouble(),
      startsAt: DateTime.parse(json['startsAt'] as String),
      endsAt: DateTime.parse(json['endsAt'] as String),
    );

Map<String, dynamic> _$$_CourtSlotToJson(_$_CourtSlot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'players': instance.players.map((e) => e.toJson()).toList(),
      'ticketPrice': instance.ticketPrice,
      'startsAt': instance.startsAt.toIso8601String(),
      'endsAt': instance.endsAt.toIso8601String(),
    };
