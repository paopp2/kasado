import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

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
    @Default('') String teamName,
    @Default(false) bool hasPaid,
    @Default(0) int mvpVoteCount,
    @Default('') String votedMvpId,
  }) = _KasadoUser;

  bool get hasVotedForMvp => (votedMvpId.isNotEmpty);

  factory KasadoUser.fromJson(Map<String, dynamic> json) =>
      _$KasadoUserFromJson(json);
}
