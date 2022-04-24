import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/slot_player_info/slot_player_info.dart';
import 'package:kasado/model/time_range/time_range.dart';

part 'court_slot.freezed.dart';
part 'court_slot.g.dart';

@freezed
class CourtSlot with _$CourtSlot {
  const CourtSlot._();
  const factory CourtSlot({
    required String slotId,
    required String courtId,
    required TimeRange timeRange,
    // TODO: Assert courtName and ticketPrice as required
    // (Firestore might have to be edited manually to avoid null errors)
    @Default('Pitogo Basketball Court') String courtName,
    @Default(30) double ticketPrice,
    @Default([]) List<KasadoUser> players,
    @Default(false) bool isClosedByAdmin,
    @Default(null) String? liveGameStatsId,
    @Default([]) List<KasadoUser>? stageHomeTeamPlayers,
    @Default([]) List<KasadoUser>? stageAwayTeamPlayers,
    @Default({}) Map<String, SlotPlayerInfo> slotInfoPerPlayer,
    required int maxPlayerCount,
    required int minPlayerCount,
  }) = _CourtSlot;

  int get playerCount => players.length;
  int get availablePlayerSlots => (maxPlayerCount - playerCount);
  bool get isFull => (playerCount == maxPlayerCount);
  bool get isLackingPlayers => (playerCount < minPlayerCount);
  bool hasPlayer(KasadoUser user) => players.any((p) => (p.id == user.id));

  static String getIdFromTimeRange(TimeRange? timeRange) {
    if (timeRange == null) return 'paththatdoesntexist';

    return "${timeRange.startsAt.toIso8601String()}-${timeRange.endsAt.toIso8601String()}";
  }

  factory CourtSlot.fromJson(Map<String, dynamic> json) =>
      _$CourtSlotFromJson(json);
}
