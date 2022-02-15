import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kasado_user.freezed.dart';
part 'kasado_user.g.dart';

@freezed
class KasadoUser with _$KasadoUser {
  const factory KasadoUser({
    required String id,
    String? displayName,
    String? email,
    String? phoneNumber,
    String? photoUrl,
  }) = _KasadoUser;

  factory KasadoUser.fromJson(Map<String, dynamic> json) =>
      _$KasadoUserFromJson(json);
}
