// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feedback _$$_FeedbackFromJson(Map<String, dynamic> json) => _$_Feedback(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      body: json['body'] as String,
      sender: json['sender'] == null
          ? null
          : KasadoUser.fromJson(json['sender'] as Map<String, dynamic>),
      sentAt: DateTime.parse(json['sentAt'] as String),
    );

Map<String, dynamic> _$$_FeedbackToJson(_$_Feedback instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'sender': instance.sender?.toJson(),
      'sentAt': instance.sentAt.toIso8601String(),
    };
