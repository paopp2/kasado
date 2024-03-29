// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourtSlot _$$_CourtSlotFromJson(Map<String, dynamic> json) => _$_CourtSlot(
      slotId: json['slotId'] as String,
      courtId: json['courtId'] as String,
      timeRange: TimeRange.fromJson(json['timeRange'] as Map<String, dynamic>),
      courtName: json['courtName'] as String? ?? 'Pitogo Basketball Court',
      ticketPrice: (json['ticketPrice'] as num?)?.toDouble() ?? 30,
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
      slotInfoPerPlayer: (json['slotInfoPerPlayer'] as Map<String, dynamic>?)
              ?.map(
            (k, e) =>
                MapEntry(k, SlotPlayerInfo.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      maxPlayerCount: json['maxPlayerCount'] as int? ?? 25,
      minPlayerCount: json['minPlayerCount'] as int? ?? 15,
      playerIdQueue: (json['playerIdQueue'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CourtSlotToJson(_$_CourtSlot instance) =>
    <String, dynamic>{
      'slotId': instance.slotId,
      'courtId': instance.courtId,
      'timeRange': instance.timeRange.toJson(),
      'courtName': instance.courtName,
      'ticketPrice': instance.ticketPrice,
      'players': instance.players.map((e) => e.toJson()).toList(),
      'isClosedByAdmin': instance.isClosedByAdmin,
      'liveGameStatsId': instance.liveGameStatsId,
      'stageHomeTeamPlayers':
          instance.stageHomeTeamPlayers?.map((e) => e.toJson()).toList(),
      'stageAwayTeamPlayers':
          instance.stageAwayTeamPlayers?.map((e) => e.toJson()).toList(),
      'slotInfoPerPlayer':
          instance.slotInfoPerPlayer.map((k, e) => MapEntry(k, e.toJson())),
      'maxPlayerCount': instance.maxPlayerCount,
      'minPlayerCount': instance.minPlayerCount,
      'playerIdQueue': instance.playerIdQueue,
    };
