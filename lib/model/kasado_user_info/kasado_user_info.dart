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
    @Default(false) bool isSuperAdmin,
    @Default(0) double pondo,
    DateTime? reservedAt,
  }) = _KasadoUserInfo;

  bool get hasReserved {
    if (reservedAt == null) return false;

    final now = DateTime.now();
    final isReservedAtFuture = reservedAt?.isAfter(now) ?? false;
    return isReservedAtFuture;
  }

  bool hasEnoughPondoToPay(double pondoToPay) {
    return pondo >= pondoToPay;
  }

  factory KasadoUserInfo.fromJson(Map<String, dynamic> json) =>
      _$KasadoUserInfoFromJson(json);
}
