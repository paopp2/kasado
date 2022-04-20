// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stats _$$_StatsFromJson(Map<String, dynamic> json) => _$_Stats(
      id: json['id'] as String?,
      player: KasadoUser.fromJson(json['player'] as Map<String, dynamic>),
      courtSlot: CourtSlot.fromJson(json['courtSlot'] as Map<String, dynamic>),
      threePA: json['threePA'] as int? ?? 0,
      threePM: json['threePM'] as int? ?? 0,
      twoPA: json['twoPA'] as int? ?? 0,
      twoPM: json['twoPM'] as int? ?? 0,
      ftA: json['ftA'] as int? ?? 0,
      ftM: json['ftM'] as int? ?? 0,
      oReb: json['oReb'] as int? ?? 0,
      dReb: json['dReb'] as int? ?? 0,
      ast: json['ast'] as int? ?? 0,
      stl: json['stl'] as int? ?? 0,
      blk: json['blk'] as int? ?? 0,
      hasWonGame: json['hasWonGame'] as bool?,
    );

Map<String, dynamic> _$$_StatsToJson(_$_Stats instance) => <String, dynamic>{
      'id': instance.id,
      'player': instance.player.toJson(),
      'courtSlot': instance.courtSlot.toJson(),
      'threePA': instance.threePA,
      'threePM': instance.threePM,
      'twoPA': instance.twoPA,
      'twoPM': instance.twoPM,
      'ftA': instance.ftA,
      'ftM': instance.ftM,
      'oReb': instance.oReb,
      'dReb': instance.dReb,
      'ast': instance.ast,
      'stl': instance.stl,
      'blk': instance.blk,
      'hasWonGame': instance.hasWonGame,
    };
