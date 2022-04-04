// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourtSlot _$$_CourtSlotFromJson(Map<String, dynamic> json) => _$_CourtSlot(
      slotId: json['slotId'] as String,
      courtId: json['courtId'] as String,
      timeRange: TimeRange.fromJson(json['timeRange'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>?)
              ?.map((e) => KasadoUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isClosedByAdmin: json['isClosedByAdmin'] as bool? ?? false,
      liveGameStatsId: json['liveGameStatsId'] as String? ?? null,
      stageHomeTeamPlayers: (json['stageHomeTeamPlayers'] as List<dynamic>?)
              ?.map((e) => KasadoUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stageAwayTeamPlayers: (json['stageAwayTeamPlayers'] as List<dynamic>?)
              ?.map((e) => KasadoUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CourtSlotToJson(_$_CourtSlot instance) =>
    <String, dynamic>{
      'slotId': instance.slotId,
      'courtId': instance.courtId,
      'timeRange': instance.timeRange.toJson(),
      'players': instance.players.map((e) => e.toJson()).toList(),
      'isClosedByAdmin': instance.isClosedByAdmin,
      'liveGameStatsId': instance.liveGameStatsId,
      'stageHomeTeamPlayers':
          instance.stageHomeTeamPlayers?.map((e) => e.toJson()).toList(),
      'stageAwayTeamPlayers':
          instance.stageAwayTeamPlayers?.map((e) => e.toJson()).toList(),
    };
