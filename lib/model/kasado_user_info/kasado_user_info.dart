import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

part 'kasado_user_info.freezed.dart';
part 'kasado_user_info.g.dart';

@freezed
class KasadoUserInfo with _$KasadoUserInfo {
  const KasadoUserInfo._();
  const factory KasadoUserInfo({
    required String id,
    required KasadoUser user,
    @Default(false) bool isAdmin,
    DateTime? reservedAt,
  }) = _KasadoUserInfo;

  bool get hasReserved => reservedAt != null;

  factory KasadoUserInfo.fromJson(Map<String, dynamic> json) =>
      _$KasadoUserInfoFromJson(json);
}
