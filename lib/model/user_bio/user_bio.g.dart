// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserBio _$$_UserBioFromJson(Map<String, dynamic> json) => _$_UserBio(
      heightFt: (json['heightFt'] as num?)?.toDouble(),
      heightIn: (json['heightIn'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      positions: (json['positions'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$PlayerPositionEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserBioToJson(_$_UserBio instance) =>
    <String, dynamic>{
      'heightFt': instance.heightFt,
      'heightIn': instance.heightIn,
      'weight': instance.weight,
      'positions':
          instance.positions.map((e) => _$PlayerPositionEnumMap[e]).toList(),
    };

const _$PlayerPositionEnumMap = {
  PlayerPosition.pg: 'pg',
  PlayerPosition.sg: 'sg',
  PlayerPosition.sf: 'sf',
  PlayerPosition.pf: 'pf',
  PlayerPosition.c: 'c',
};
