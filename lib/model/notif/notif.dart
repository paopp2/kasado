import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

part 'notif.freezed.dart';
part 'notif.g.dart';

@freezed
class Notif with _$Notif {
  const factory Notif({
    required String id,
    @Default('') String title,
    required String body,
    KasadoUser? sender,
    required DateTime sentAt,
    @Default(false) bool isRead,
    @Default(null) bool? hasLiked,
  }) = NotifObject;

  const factory Notif.meta({
    required String id,
    @Default('') String title,
    required DateTime sentAt,
    @Default(0) int yesCount,
    @Default(0) int noCount,
    @Default(false) bool needsFeedback,
  }) = NotifMeta;

  factory Notif.fromJson(Map<String, dynamic> json) => _$NotifFromJson(json);
}
