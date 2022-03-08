// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasado_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KasadoUserInfo _$$_KasadoUserInfoFromJson(Map<String, dynamic> json) =>
    _$_KasadoUserInfo(
      id: json['id'] as String,
      user: KasadoUser.fromJson(json['user'] as Map<String, dynamic>),
      isAdmin: json['isAdmin'] as bool? ?? false,
      isSuperAdmin: json['isSuperAdmin'] as bool? ?? false,
      pondo: (json['pondo'] as num?)?.toDouble() ?? 0,
      isTeamCaptain: json['isTeamCaptain'] as bool? ?? false,
      teamId: json['teamId'] as String?,
      reservedAt: json['reservedAt'] == null
          ? null
          : CourtSlot.fromJson(json['reservedAt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_KasadoUserInfoToJson(_$_KasadoUserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'isAdmin': instance.isAdmin,
      'isSuperAdmin': instance.isSuperAdmin,
      'pondo': instance.pondo,
      'isTeamCaptain': instance.isTeamCaptain,
      'teamId': instance.teamId,
      'reservedAt': instance.reservedAt?.toJson(),
    };
