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
    @Default(0) int yesCount,
    @Default(0) int noCount,
    KasadoUser? sender,
    @Default(false) bool sendToAll,
    @Default(false) bool getFeedback,
    @Default(0) List<String> recipientIds,
    required DateTime sentAt,
  }) = _Notif;

  const factory Notif.ref({
    required String id,
    @Default(false) bool isRead,
  }) = NotifRef;

  factory Notif.fromJson(Map<String, dynamic> json) => _$NotifFromJson(json);
}
