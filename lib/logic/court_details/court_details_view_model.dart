import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/data/repositories/team_repository.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/court_details/slot_and_user_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final courtDetailsViewModel = Provider.autoDispose(
  (ref) => CourtDetailsViewModel(
    read: ref.read,
    courtRepo: ref.watch(courtRepositoryProvider),
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
    teamRepo: ref.watch(teamRepositoryProvider),
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
    required this.teamRepo,
    required this.adminController,
    required this.currentUser,
    required this.currentUserInfo,
    required this.utils,
  }) : super(read);

  final CourtRepository courtRepo;
  final UserInfoRepository userInfoRepo;
  final TeamRepository teamRepo;
  final CourtAdminController adminController;
  final KasadoUser currentUser;
  final KasadoUserInfo? currentUserInfo;
  final KasadoUtils utils;

  @override
  void initState([Map<String, Object?>? params]) {
    FirebaseAnalytics.instance.logEvent(
      name: 'court_details_view',
      parameters: {
        'user_id': currentUser.toJson().toString(),
        'user_info': currentUserInfo?.toJson().toString(),
        'court_id': params!['court_id'],
      },
    );
  }

  SlotAndUserState getSlotAndUserState(CourtSlot courtSlot) {
    if (currentUserInfo == null) return SlotAndUserState.loading;
    final user = currentUserInfo!;
    final userReservedHere = (courtSlot.courtId == user.reservedAt?.courtId) &&
        (courtSlot.slotId == user.reservedAt?.slotId);

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

  /// Join/Leave [baseCourtSlot] depending on whether [slotHasPlayer] for self
  Future<void> selfJoinLeaveCourtSlot({
    required CourtSlot baseCourtSlot,
    required bool slotHasPlayer,
    required double courtTicketPrice,
    BuildContext? context,
  }) async {
    if (slotHasPlayer) {
      await leaveCourtSlot(
        userInfo: currentUserInfo!,
        baseCourtSlot: baseCourtSlot,
        courtTicketPrice: courtTicketPrice,
        context: context,
      );
    } else {
      await joinCourtSlot(
        userInfo: currentUserInfo!,
        baseCourtSlot: baseCourtSlot,
        courtTicketPrice: courtTicketPrice,
        context: context,
      );
    }
  }

  Future<void> joinCourtSlot({
    required CourtSlot baseCourtSlot,
    required double courtTicketPrice,
    required KasadoUserInfo userInfo,
    BuildContext? context,
  }) async {
    await getSlotAndUserState(baseCourtSlot).when(
      slotFull: () => Fluttertoast.showToast(msg: 'Slot is full'),
      userReservedAtAnotherSlot: () => Fluttertoast.showToast(
        msg: 'Only 1 reservation allowed at a time',
      ),
      orElse: () async {
        KasadoUser? paidUser;
        // If slot is not full and user is not reserved at another slot, check
        // if user has enough pondo to pay for joining
        if (userInfo.hasEnoughPondoToPay(courtTicketPrice)) {
          // If user has enough pondo, use pondo to pay for court ticket
          userInfoRepo.addOrDeductPondo(
            currentUserInfo: currentUserInfo!,
            isAdd: false,
            pondo: courtTicketPrice,
          );
          paidUser = userInfo.user.copyWith(hasPaid: true);
        }

        // Add user to courtSlot indicating whether user has already paid/not
        await courtRepo.addPlayerToCourtSlot(
          courtSlot: baseCourtSlot,
          player: paidUser ?? userInfo.user,
        );

        if (context != null) Navigator.pop(context);
      },
    );
  }

  Future<void> leaveCourtSlot({
    required KasadoUserInfo userInfo,
    required CourtSlot baseCourtSlot,
    required double courtTicketPrice,
    BuildContext? context,
  }) async {
    final KasadoUser player =
        baseCourtSlot.players.singleWhere((p) => (p.id == userInfo.id));

    // If player has already paid for slot, return money (re-add to user's pondo)
    if (player.hasPaid) {
      await userInfoRepo.addOrDeductPondo(
        currentUserInfo: currentUserInfo!,
        isAdd: true,
        pondo: courtTicketPrice,
      );
    }

    await courtRepo.removePlayerFromCourtSlot(
      player: player,
      courtSlot: baseCourtSlot,
    );

    if (context != null) Navigator.pop(context);
  }

  Future<void> kickFromCourtSlot({
    required CourtSlot baseCourtSlot,
    required double courtTicketPrice,
    required String userToKickId,
  }) async {
    final KasadoUser playerToKick =
        baseCourtSlot.players.singleWhere((p) => (p.id == userToKickId));

    // If player has already paid for slot, return money (re-add to user's pondo)
    if (playerToKick.hasPaid) {
      final baseUserInfo = await userInfoRepo.getUserInfo(userToKickId);
      await userInfoRepo.addOrDeductPondo(
        currentUserInfo: baseUserInfo!,
        isAdd: true,
        pondo: courtTicketPrice,
      );
    }

    await courtRepo.removePlayerFromCourtSlot(
      player: playerToKick,
      courtSlot: baseCourtSlot,
    );
  }
}
