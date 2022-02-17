import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/allowed_time_ranges.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/logic/courts_owned/courts_owned_state.dart';
import 'package:kasado/logic/courts_owned/courts_owned_tec_mixin.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:uuid/uuid.dart';

final courtsOwnedViewModel = Provider.autoDispose(
  (ref) => CourtsOwnedViewModel(
    read: ref.read,
    courtRepo: ref.watch(courtRepositoryProvider),
    currentUser: ref.watch(currentUserProvider)!,
  ),
);

class CourtsOwnedViewModel extends ViewModel with CourtsOwnedTecMixin {
  CourtsOwnedViewModel({
    required Reader read,
    required this.courtRepo,
    required this.currentUser,
  }) : super(read);

  final CourtRepository courtRepo;
  final KasadoUser currentUser;

  void selectSchedChip(bool isSelected, int index) {
    read(selectedChipIndicesProvider.notifier).update((s) {
      if (isSelected) {
        return [...s, index];
      } else {
        return [...s]..remove(index);
      }
    });
  }

  bool isSchedIndexSelected(int index) {
    return read(selectedChipIndicesProvider).contains(index);
  }

  Future<void> addNewCourt(BuildContext context) async {
    final List<int> selectedIndices = read(selectedChipIndicesProvider);
    final List<TimeRange> allowedTimeSlots =
        selectedIndices.map((i) => allowedTimeRanges[i]).toList();
    final now = DateTime.now();
    // TODO: Move this to utils, when having to use more than once
    final TimeRange nextNearestTimeSlot = allowedTimeSlots.reduce((a, b) {
      final TimeOfDay aStart = a.startTime;
      final TimeOfDay aEnd = a.endTime;
      final TimeOfDay bStart = b.startTime;
      final TimeOfDay bEnd = b.endTime;

      final aStartDateTime =
          DateTime(now.year, now.month, now.day, aStart.hour, aStart.minute);
      final aEndDateTime =
          DateTime(now.year, now.month, now.day, aEnd.hour, aEnd.minute);
      final bStartDateTime =
          DateTime(now.year, now.month, now.day, bStart.hour, bStart.minute);
      final bEndDateTime =
          DateTime(now.year, now.month, now.day, bEnd.hour, bEnd.minute);

      final aAdjustedTimeRange = TimeRange(
        startsAt: aStartDateTime,
        endsAt: aEndDateTime,
      );
      final bAdjustedTimeRange = TimeRange(
        startsAt: bStartDateTime,
        endsAt: bEndDateTime,
      );

      if (aStartDateTime.isBefore(now)) return bAdjustedTimeRange;

      return (aStartDateTime.isBefore(bStartDateTime))
          ? aAdjustedTimeRange
          : bAdjustedTimeRange;
    });
    final courtId = const Uuid().v4();
    await courtRepo.pushCourt(
      Court(
        id: courtId,
        name: tecCourtName.text,
        address: tecCourtAddress.text,
        photoUrl: tecCourtPhotoUrl.text,
        ticketPrice: double.parse(tecTicketPrice.text),
        allowedTimeSlots: allowedTimeSlots,
        admins: [currentUser],
        nextAvailableSlot: CourtSlot(
          courtId: courtId,
          players: [],
          timeRange: nextNearestTimeSlot,
        ),
      ),
    );
    // TODO: Implement better routing on NewCourtInput through GoRouter
    Navigator.pop(context);
  }
}
