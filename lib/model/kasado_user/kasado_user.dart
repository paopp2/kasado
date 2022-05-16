import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/user_bio/user_bio.dart';

part 'kasado_user.freezed.dart';
part 'kasado_user.g.dart';

@freezed
class KasadoUser with _$KasadoUser {
  const KasadoUser._();
  const factory KasadoUser({
    required String id,
    String? displayName,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    UserBio? userBio,
    @Default('') String teamName,
    @Default(false) bool hasPaid,
  }) = _KasadoUser;

  factory KasadoUser.fromJson(Map<String, dynamic> json) =>
      _$KasadoUserFromJson(json);
}
