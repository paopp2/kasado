import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  const Ticket._();
  const factory Ticket({
    required String id,
    required CourtSlot courtSlot,
  }) = _Ticket;

  // The reason for adding 1hr is because a slot is considered to be done only
  // after an hour from when it started
  DateTime get expiry {
    return courtSlot.timeRange.startsAt.add(const Duration(hours: 1));
  }

  bool get isExpired {
    final now = DateTime.now();

    return expiry.isBefore(now);
  }

  /// Bundles required data by the propriety scanner to add a player to queue
  String getQrData(KasadoUser user) =>
      "${user.photoUrl}~${user.displayName}~${courtSlot.courtId}~${courtSlot.slotId}";

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
