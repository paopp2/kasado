import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/constants/enums/player_position.dart';

part 'user_bio.freezed.dart';
part 'user_bio.g.dart';

@freezed
class UserBio with _$UserBio {
  const UserBio._();
  const factory UserBio({
    DateTime? birthdate,
    double? heightFt,
    double? heightIn,
    double? weight,
    @Default([]) List<PlayerPosition> positions,
  }) = _UserBio;

  factory UserBio.fromJson(Map<String, dynamic> json) =>
      _$UserBioFromJson(json);
}
