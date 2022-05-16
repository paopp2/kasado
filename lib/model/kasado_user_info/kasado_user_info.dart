import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/overview_stats/overview_stats.dart';
import 'package:kasado/model/ticket/ticket.dart';
import 'package:kasado/model/user_bio/user_bio.dart';

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
    UserBio? userBio,
  }) = _KasadoUserInfo;

  bool get hasReserved {
    if (tickets.isEmpty) return false;

    final now = DateTime.now();

    // Check if user has any pending tickets reserved for the future.
    return tickets.any((ticket) => ticket.expiry.isAfter(now));
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

  List<Ticket> get validTickets => tickets.where((t) => !t.isExpired).toList();

  factory KasadoUserInfo.fromJson(Map<String, dynamic> json) =>
      _$KasadoUserInfoFromJson(json);
}
