import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/date_time_related_constants.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/court_details/court_admin/court_admin_state.dart';
import 'package:kasado/logic/court_details/court_admin/court_admin_tec_mixin.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:uuid/uuid.dart';

final courtAdminController = Provider.autoDispose(
  (ref) => CourtAdminController(
    read: ref.read,
    courtRepo: ref.watch(courtRepositoryProvider),
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
    currentUser: ref.watch(currentUserProvider)!,
    utils: ref.watch(kasadoUtilsProvider),
  ),
);

class CourtAdminController with CourtAdminTecMixin {
  CourtAdminController({
    required this.read,
    required this.courtRepo,
    required this.currentUser,
    required this.utils,
    required this.userInfoRepo,
  });

  final Reader read;
  final CourtRepository courtRepo;
  final UserInfoRepository userInfoRepo;
  final KasadoUser currentUser;
  final KasadoUtils utils;

  Future<void> togglePlayerPaymentStatus({
    required CourtSlot baseCourtSlot,
    required KasadoUser player,
  }) async {
    assert(baseCourtSlot.hasPlayer(player));
    final playerIndex = baseCourtSlot.players.indexOf(player);
    await courtRepo.pushCourtSlot(
      courtSlot: baseCourtSlot.copyWith(
        players: baseCourtSlot.players
          ..[playerIndex] = player.copyWith(hasPaid: !player.hasPaid),
      ),
    );
  }

  void selectSchedChip(bool isSelected, int index) {
    read(selectedSchedChipIndicesProvider.notifier).update((s) {
      if (isSelected) {
        return [...s, index];
      } else {
        return [...s]..remove(index);
      }
    });
  }

  bool isSchedIndexSelected(int index) {
    return read(selectedSchedChipIndicesProvider).contains(index);
  }

  void selectWeekDayChip(bool isSelected, int index) {
    read(selectedDayChipIndicesProvider.notifier).update((s) {
      if (isSelected) {
        return [...s, index];
      } else {
        return [...s]..remove(index);
      }
    });
  }

  /// If (forEdit), courtId must not be null
  Future<void> openCourtInputDialog({
    required BuildContext context,
    required Widget dialog,
    bool forEdit = false,
    Court? court,
  }) async {
    // assert that courtId != null when in 'edit mode'
    assert(forEdit == (court != null));
    if (forEdit) {
      setupCourtToEdit(court!, (dayChipIndices, schedChipIndices) {
        read(selectedSchedChipIndicesProvider.notifier).state =
            schedChipIndices;
        read(selectedDayChipIndicesProvider.notifier).state = dayChipIndices;
      });
    }
    showDialog(
      context: context,
      builder: (_) => dialog,
    ).then((_) {
      read(selectedSchedChipIndicesProvider.notifier).state = [];
      read(selectedDayChipIndicesProvider.notifier).state = [];
      clearAllTecs();
    });
  }

  bool isWeekDayIndexSelected(int index) {
    return read(selectedDayChipIndicesProvider).contains(index);
  }

  /// If (isEdit), courtId must not be null
  Future<void> pushCourt({
    required BuildContext context,
    bool isEdit = false,
    String? courtId,
  }) async {
    final List<int> selectedSchedIndices =
        read(selectedSchedChipIndicesProvider);
    final List<int> selectedWeekDayIndices =
        read(selectedDayChipIndicesProvider);
    final List<TimeRange> allowedTimeSlots =
        selectedSchedIndices.map((si) => allowedTimeRanges[si]).toList();
    final List<WeekDays> allowedWeekDays =
        selectedWeekDayIndices.map((di) => indexToWeekDay[di]).toList();
    final TimeRange? nextNearestTimeSlot = utils.getNextTimeSlotForToday(
      timeSlots: allowedTimeSlots,
      weekdays: allowedWeekDays,
    );

    // assert that courtId != null when in 'edit mode'
    assert(isEdit == (courtId != null));
    final id = (isEdit) ? courtId! : const Uuid().v4();

    await courtRepo.pushCourt(
      Court(
        id: id,
        name: tecCourtName.text,
        address: tecCourtAddress.text,
        photoUrl: tecCourtPhotoUrl.text,
        ticketPrice: double.parse(tecTicketPrice.text),
        allowedTimeSlots: allowedTimeSlots,
        adminIds: [currentUser.id],
        nextAvailableSlot: (nextNearestTimeSlot == null)
            ? null
            : CourtSlot(
                courtId: id,
                players: [],
                timeRange: nextNearestTimeSlot,
              ),
        allowedWeekDays: allowedWeekDays,
      ),
    );

    await userInfoRepo.setUserAdminPrivileges(
      userId: currentUser.id,
      isAdmin: true,
    );

    // TODO: Implement better routing on NewCourtInput through GoRouter
    Navigator.pop(context);
  }

  Future<void> setCourtSlotClosed({
    required CourtSlot courtSlot,
    required bool closeCourt,
  }) async {
    await courtRepo.setCourtSlotClosed(
      courtSlot: courtSlot,
      isCourtClosed: closeCourt,
    );
  }

  Future<void> deleteCourt(Court court) async {
    await courtRepo.deleteCourt(court);
  }
}
