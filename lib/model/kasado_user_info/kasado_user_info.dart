import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/overview_stats/overview_stats.dart';
import 'package:kasado/model/ticket/ticket.dart';

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
    @Default(false) bool isTeamCaptain,
    @Default(OverviewStats()) OverviewStats overviewStats,
    String? teamId,
    @Default([]) List<Ticket> tickets,
  }) = _KasadoUserInfo;

  bool get hasReserved {
    if (tickets.isEmpty) return false;

    final now = DateTime.now();
    // Check if user has any pending tickets reserved for the future.
    // The reason for adding 1hr is because a slot is considered to be done only
    // after an hour from when it started. Might have to refactor in the future.
    return tickets.any(
      (ticket) => ticket.courtSlot.timeRange.startsAt
          .add(const Duration(hours: 1))
          .isAfter(now),
    );
  }

  bool hasSchedConflict(CourtSlot courtSlot) {
    return tickets.any(
      (ticket) => ticket.courtSlot.timeRange.startsAt
          .isAtSameMomentAs(courtSlot.timeRange.startsAt),
    );
  }

  bool isReservedHere(CourtSlot courtSlot) {
    return tickets.any((ticket) =>
        (ticket.courtSlot.courtId == courtSlot.courtId) &&
        (ticket.courtSlot.slotId == courtSlot.slotId));
  }

  bool get hasTeam => (teamId != null);

  bool hasEnoughPondoToPay(double pondoToPay) {
    return pondo >= pondoToPay;
  }

  factory KasadoUserInfo.fromJson(Map<String, dynamic> json) =>
      _$KasadoUserInfoFromJson(json);
}
