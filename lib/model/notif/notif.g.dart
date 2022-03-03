// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notif.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotifInfo _$$NotifInfoFromJson(Map<String, dynamic> json) => _$NotifInfo(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      body: json['body'] as String,
      yesCount: json['yesCount'] as int? ?? 0,
      noCount: json['noCount'] as int? ?? 0,
      sender: json['sender'] == null
          ? null
          : KasadoUser.fromJson(json['sender'] as Map<String, dynamic>),
      sendToAll: json['sendToAll'] as bool? ?? false,
      getFeedback: json['getFeedback'] as bool? ?? false,
      recipientIds: (json['recipientIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isRead: json['isRead'] as bool? ?? false,
      sentAt: DateTime.parse(json['sentAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotifInfoToJson(_$NotifInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'yesCount': instance.yesCount,
      'noCount': instance.noCount,
      'sender': instance.sender?.toJson(),
      'sendToAll': instance.sendToAll,
      'getFeedback': instance.getFeedback,
      'recipientIds': instance.recipientIds,
      'isRead': instance.isRead,
      'sentAt': instance.sentAt.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$NotifRef _$$NotifRefFromJson(Map<String, dynamic> json) => _$NotifRef(
      id: json['id'] as String,
      isRead: json['isRead'] as bool? ?? false,
      sentAt: DateTime.parse(json['sentAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotifRefToJson(_$NotifRef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isRead': instance.isRead,
      'sentAt': instance.sentAt.toIso8601String(),
      'runtimeType': instance.$type,
    };
