// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notif.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotifObject _$$NotifObjectFromJson(Map<String, dynamic> json) =>
    _$NotifObject(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      body: json['body'] as String,
      sender: json['sender'] == null
          ? null
          : KasadoUser.fromJson(json['sender'] as Map<String, dynamic>),
      sentAt: DateTime.parse(json['sentAt'] as String),
      needsFeedback: json['needsFeedback'] as bool? ?? false,
      isRead: json['isRead'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotifObjectToJson(_$NotifObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'sender': instance.sender?.toJson(),
      'sentAt': instance.sentAt.toIso8601String(),
      'needsFeedback': instance.needsFeedback,
      'isRead': instance.isRead,
      'runtimeType': instance.$type,
    };

_$NotifMeta _$$NotifMetaFromJson(Map<String, dynamic> json) => _$NotifMeta(
      id: json['id'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
      yesCount: json['yesCount'] as int? ?? 0,
      noCount: json['noCount'] as int? ?? 0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotifMetaToJson(_$NotifMeta instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sentAt': instance.sentAt.toIso8601String(),
      'yesCount': instance.yesCount,
      'noCount': instance.noCount,
      'runtimeType': instance.$type,
    };
