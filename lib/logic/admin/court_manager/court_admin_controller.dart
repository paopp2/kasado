import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/date_time_related_constants.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/data/repositories/court_slot_repository.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_state.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_tec_mixin.dart';
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
    courtSlotRepo: ref.watch(courtSlotRepositoryProvider),
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
    currentUser: ref.watch(currentUserProvider)!,
  ),
);

class CourtAdminController with CourtAdminTecMixin {
  CourtAdminController({
    required this.read,
    required this.courtRepo,
    required this.courtSlotRepo,
    required this.currentUser,
    required this.userInfoRepo,
  });

  final Reader read;
  final CourtRepository courtRepo;
  final CourtSlotRepository courtSlotRepo;
  final UserInfoRepository userInfoRepo;
  final KasadoUser currentUser;

  Future<void> togglePlayerPaymentStatus({
    required CourtSlot baseCourtSlot,
    required KasadoUser player,
  }) async {
    assert(baseCourtSlot.hasPlayer(player));
    final playerIndex = baseCourtSlot.players.indexOf(player);
    await courtSlotRepo.pushCourtSlot(
      courtSlot: baseCourtSlot.copyWith(
        players: baseCourtSlot.players
          ..[playerIndex] = player.copyWith(hasPaid: !player.hasPaid),
      ),
    );
  }

  void selectSchedChip(bool isSelected, int index) {
    read(selectedSchedChipIndicesProvider.notifier).update((s) {
      // Using conditional expressions results to a bug where chip doesn't update
      // ignore: prefer-conditional-expressions
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
      // Using conditional expressions results to a bug where chip doesn't update
      // ignore: prefer-conditional-expressions
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

    // assert that courtId != null when in 'edit mode'
    assert(isEdit == (courtId != null));
    final id = (isEdit) ? courtId! : const Uuid().v4();

    Court? baseCourtInfo;
    if (isEdit) {
      // If edit, get the baseCourtInfo to obtain the existing court admins from
      baseCourtInfo = await courtRepo.getCourt(courtId!);
    } else {
      // Else if this is a new court to be pushed, set the current user's (the
      // one who added this new court) privileges to admin
      await userInfoRepo.setUserAdminPrivileges(
        userId: currentUser.id,
        isAdmin: true,
      );
    }

    // Push or update court
    await courtRepo.pushCourt(
      Court(
        id: id,
        name: tecCourtName.text,
        address: tecCourtAddress.text,
        photoUrl: tecCourtPhotoUrl.text,
        ticketPrice: double.parse(tecTicketPrice.text),
        allowedTimeSlots: allowedTimeSlots,
        adminIds: baseCourtInfo?.adminIds ?? [currentUser.id],
        allowedWeekDays: allowedWeekDays,
      ),
      isUpdate: isEdit,
    );

    Navigator.pop(context);
  }

  Future<void> hideOtherCourtSlotsWithSameDayAs(CourtSlot courtSlot) async {
    await courtRepo.hideOtherCourtSlotsWithSameDayAs(courtSlot);
  }

  Future<void> setCourtSlotClosed({
    required BuildContext context,
    required CourtSlot courtSlot,
    required bool closeCourt,
  }) async {
    Navigator.pop(context);
    await courtSlotRepo.setCourtSlotClosed(
      courtSlot: courtSlot,
      isCourtClosed: closeCourt,
    );
  }

  Future<void> deleteCourt(Court court) async {
    await courtRepo.deleteCourt(court);
  }
}
