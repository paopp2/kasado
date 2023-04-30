import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kasado/constants/enums/game_stat_entry_type.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

part 'game_stat_entry.freezed.dart';
part 'game_stat_entry.g.dart';

@freezed
class GameStatEntry with _$GameStatEntry {
  const factory GameStatEntry({
    required KasadoUser player,
    required GameStatEntryType statType,
    required bool isHome,
    Map<String, dynamic>? statMeta,
  }) = _GameStatEntry;

  factory GameStatEntry.fromJson(Map<String, dynamic> json) =>
      _$GameStatEntryFromJson(json);
}
