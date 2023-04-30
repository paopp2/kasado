// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_stat_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameStatEntry _$$_GameStatEntryFromJson(Map<String, dynamic> json) =>
    _$_GameStatEntry(
      player: KasadoUser.fromJson(json['player'] as Map<String, dynamic>),
      statType: $enumDecode(_$GameStatEntryTypeEnumMap, json['statType']),
      isHome: json['isHome'] as bool,
      statMeta: json['statMeta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_GameStatEntryToJson(_$_GameStatEntry instance) =>
    <String, dynamic>{
      'player': instance.player.toJson(),
      'statType': _$GameStatEntryTypeEnumMap[instance.statType]!,
      'isHome': instance.isHome,
      'statMeta': instance.statMeta,
    };

const _$GameStatEntryTypeEnumMap = {
  GameStatEntryType.shotAttempt: 'shotAttempt',
  GameStatEntryType.ftAttempt: 'ftAttempt',
  GameStatEntryType.block: 'block',
  GameStatEntryType.steal: 'steal',
  GameStatEntryType.rebound: 'rebound',
  GameStatEntryType.turnover: 'turnover',
};
