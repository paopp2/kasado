// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourtSlot _$$_CourtSlotFromJson(Map<String, dynamic> json) => _$_CourtSlot(
      courtId: json['courtId'] as String,
      courtName: json['courtName'] as String,
      courtPhotoUrl: json['courtPhotoUrl'] as String,
      players: (json['players'] as List<dynamic>)
          .map((e) => KasadoUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      ticketPrice: (json['ticketPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CourtSlotToJson(_$_CourtSlot instance) =>
    <String, dynamic>{
      'courtId': instance.courtId,
      'courtName': instance.courtName,
      'courtPhotoUrl': instance.courtPhotoUrl,
      'players': instance.players.map((e) => e.toJson()).toList(),
      'ticketPrice': instance.ticketPrice,
    };
