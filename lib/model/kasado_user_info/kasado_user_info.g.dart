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
      isReserved: json['isReserved'] as bool? ?? false,
    );

Map<String, dynamic> _$$_KasadoUserInfoToJson(_$_KasadoUserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'isAdmin': instance.isAdmin,
      'isReserved': instance.isReserved,
    };
