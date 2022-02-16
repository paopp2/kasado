import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/allowed_time_ranges.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/logic/courts_owned/courts_owned_state.dart';
import 'package:kasado/logic/courts_owned/courts_owned_tec_mixin.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/time_range/time_range.dart';

final courtsOwnedViewModel = Provider.autoDispose(
  (ref) => CourtsOwnedViewModel(
    read: ref.read,
    courtRepo: ref.watch(courtRepositoryProvider),
  ),
);

class CourtsOwnedViewModel extends ViewModel with CourtsOwnedTecMixin {
  CourtsOwnedViewModel({
    required Reader read,
    required this.courtRepo,
  }) : super(read);

  final CourtRepository courtRepo;

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

  Future<void> addNewCourt() async {
    final List<int> selectedIndices = read(selectedChipIndicesProvider);
    final List<TimeRange> allowedTimeSlots =
        selectedIndices.map((i) => allowedTimeRanges[i]).toList();
    final now = DateTime.now();
    final TimeRange nextNearestTimeSlot = allowedTimeSlots.reduce((a, b) {
      final TimeOfDay aStart = a.startTime;
      final TimeOfDay bStart = b.startTime;
      final aStartDateTime =
          DateTime(now.year, now.month, aStart.hour, aStart.minute);
      final bStartDateTime =
          DateTime(now.year, now.month, bStart.hour, bStart.minute);
      return aStartDateTime.difference(now) < bStartDateTime.difference(now)
          ? a
          : b;
    });
    await courtRepo.pushCourt(
      Court(
        id: 'Court ID',
        name: tecCourtName.text,
        photoUrl: tecCourtPhotoUrl.text,
        ticketPrice: double.parse(tecTicketPrice.text),
        allowedTimeSlots: allowedTimeSlots,
        nextAvailableSlot: CourtSlot(
          courtId: 'Court ID',
          players: [],
          timeRange: nextNearestTimeSlot,
        ),
      ),
    );
  }
}
