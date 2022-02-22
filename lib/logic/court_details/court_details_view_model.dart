import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/court_details/court_admin/court_admin_controller.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

enum SlotAndUserState {
  slotEnded,
  slotClosedByAdmin,
  slotFull,
  userNotReserved,
  userReservedAtThisSlot,
  userReservedAtAnotherSlot,
}

final courtDetailsViewModel = Provider.autoDispose(
  (ref) => CourtDetailsViewModel(
    read: ref.read,
    courtRepo: ref.watch(courtRepositoryProvider),
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
    currentUser: ref.watch(currentUserProvider)!,
    currentUserInfo: ref.watch(currentUserInfoProvider).value,
    adminController: ref.watch(courtAdminController),
    utils: ref.watch(kasadoUtilsProvider),
  ),
);

class CourtDetailsViewModel extends ViewModel {
  CourtDetailsViewModel({
    required Reader read,
    required this.courtRepo,
    required this.userInfoRepo,
    required this.adminController,
    required this.currentUser,
    required this.currentUserInfo,
    required this.utils,
  }) : super(read);

  final CourtRepository courtRepo;
  final CourtAdminController adminController;
  final UserInfoRepository userInfoRepo;
  final KasadoUser currentUser;
  final KasadoUserInfo? currentUserInfo;
  final KasadoUtils utils;

  SlotAndUserState getSlotAndUserState(CourtSlot courtSlot) {
    final user = currentUserInfo!;
    final userReservedHere =
        courtSlot.timeRange.startsAt.add(const Duration(hours: 1)) ==
            user.reservedAt;

    final isSlotClosed = utils.isCurrentSlotClosed(courtSlot.timeRange);
    if (isSlotClosed) {
      return SlotAndUserState.slotEnded;
    } else if (courtSlot.isClosedByAdmin) {
      return SlotAndUserState.slotClosedByAdmin;
    } else if (courtSlot.isFull) {
      return SlotAndUserState.slotFull;
    } else if (!user.hasReserved) {
      return SlotAndUserState.userNotReserved;
    } else if (userReservedHere) {
      return SlotAndUserState.userReservedAtThisSlot;
    } else {
      return SlotAndUserState.userReservedAtAnotherSlot;
    }
  }

  CourtSlot getBaseCourtSlot({
    required Appointment appointment,
    required String courtId,
    required List<CourtSlot> courtSlots,
  }) {
    final aTimeRange = TimeRange(
      startsAt: appointment.startTime,
      endsAt: appointment.endTime,
    );
    final appSlotId = CourtSlot.getIdFromTimeRange(aTimeRange);

    return courtSlots.singleWhere(
      (slot) => slot.slotId == appSlotId,
      orElse: () => CourtSlot(
        courtId: courtId,
        slotId: CourtSlot.getIdFromTimeRange(aTimeRange),
        timeRange: aTimeRange,
      ),
    );
  }

  Future<void> joinCourtSlot(
    CourtSlot baseCourtSlot, [
    BuildContext? context,
  ]) async {
    if (baseCourtSlot.isFull) {
      Fluttertoast.showToast(msg: 'Slot is full');
    } else if (baseCourtSlot.hasPlayer(currentUser)) {
      Fluttertoast.showToast(msg: 'Player already reserved');
    } else if (currentUserInfo!.hasReserved) {
      Fluttertoast.showToast(msg: 'Only 1 reservation allowed at a time');
    } else {
      if (context != null) Navigator.pop(context);
      await courtRepo.pushCourtSlot(
        courtSlot: baseCourtSlot.copyWith(
          players: [...baseCourtSlot.players, currentUser],
        ),
      );
      await userInfoRepo.reserveUserAt(
        userId: currentUser.id,
        // A court slot closes an hour before its endTime
        reservedAt: baseCourtSlot.timeRange.endsAt.subtract(
          const Duration(hours: 1),
        ),
      );
    }
  }

  Future<void> leaveCourtSlot(
    CourtSlot baseCourtSlot, [
    BuildContext? context,
  ]) async {
    if (context != null) Navigator.pop(context);
    assert(baseCourtSlot.hasPlayer(currentUser));
    final updatedPlayerList = baseCourtSlot.players
      ..removeWhere((p) => (currentUser.id == p.id));

    await userInfoRepo.reserveUserAt(
      userId: currentUser.id,
      reservedAt: null,
    );

    if (updatedPlayerList.isEmpty) {
      await courtRepo.removeCourtSlot(
        baseCourtSlot.courtId,
        baseCourtSlot.slotId,
      );
    } else {
      await courtRepo.pushCourtSlot(
        courtSlot: baseCourtSlot.copyWith(players: updatedPlayerList),
      );
    }
  }
}
