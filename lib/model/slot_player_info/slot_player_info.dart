import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'slot_player_info.freezed.dart';
part 'slot_player_info.g.dart';

@freezed
class SlotPlayerInfo with _$SlotPlayerInfo {
  const SlotPlayerInfo._();
  const factory SlotPlayerInfo({
    @Default(0) int timesPlayed,
  }) = _SlotPlayerInfo;

  factory SlotPlayerInfo.fromJson(Map<String, dynamic> json) =>
      _$SlotPlayerInfoFromJson(json);
}
