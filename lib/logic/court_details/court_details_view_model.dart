import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/data/repositories/court_slot_repository.dart';
import 'package:kasado/data/repositories/team_repository.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/court_details/slot_and_user_state.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/overview_stats/overview_stats.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final courtDetailsViewModel = Provider.autoDispose(
  (ref) => CourtDetailsViewModel(
    read: ref.read,
    courtRepo: ref.watch(courtRepositoryProvider),
    courtSlotRepo: ref.watch(courtSlotRepositoryProvider),
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
    required this.courtSlotRepo,
    required this.userInfoRepo,
    required this.teamRepo,
    required this.adminController,
    required this.currentUser,
    required this.currentUserInfo,
    required this.utils,
  }) : super(read);

  final CourtRepository courtRepo;
  final CourtSlotRepository courtSlotRepo;
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
  Future<void> joinLeaveCourtSlot({
    required CourtSlot baseCourtSlot,
    required bool slotHasPlayer,
    required double courtTicketPrice,
    required String? teamId,
    required bool isTeamCaptain,
    BuildContext? context,
  }) async {
    if (teamId == null) {
      // If player is not part of a team
      if (slotHasPlayer) {
        await removeFromCourtSlot(
          playerToRemove: currentUserInfo!.user,
          baseCourtSlot: baseCourtSlot,
          courtTicketPrice: courtTicketPrice,
          context: context,
        );
      } else {
        await addToCourtSlot(
          userInfo: currentUserInfo!,
          baseCourtSlot: baseCourtSlot,
          courtTicketPrice: courtTicketPrice,
          context: context,
        );
      }
    } else {
      // If player is part of a team
      if (slotHasPlayer) {
        await removeTeamFromCourtSlot(
          teamId: teamId,
          isTeamCaptain: isTeamCaptain,
          baseCourtSlot: baseCourtSlot,
          courtTicketPrice: courtTicketPrice,
          context: context,
        );
      } else {
        await addTeamToCourtSlot(
          teamId: teamId,
          isTeamCaptain: isTeamCaptain,
          baseCourtSlot: baseCourtSlot,
          courtTicketPrice: courtTicketPrice,
          context: context,
        );
      }
    }
  }

  Future<void> addToCourtSlot({
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
        // Add user to courtSlot
        await courtSlotRepo.addPlayerToCourtSlot(
          courtSlot: baseCourtSlot,
          player: userInfo.user,
          courtTicketPrice: courtTicketPrice,
        );

        if (context != null) Navigator.pop(context);
      },
    );
  }

  Future<void> removeFromCourtSlot({
    required KasadoUser playerToRemove,
    required CourtSlot baseCourtSlot,
    required double courtTicketPrice,
    BuildContext? context,
  }) async {
    final KasadoUser player =
        baseCourtSlot.players.singleWhere((p) => (p.id == playerToRemove.id));

    await courtSlotRepo.removePlayerFromCourtSlot(
      player: player,
      courtSlot: baseCourtSlot,
      courtTicketPrice: courtTicketPrice,
    );

    if (context != null) Navigator.pop(context);
  }

  Future<void> addTeamToCourtSlot({
    required String teamId,
    required bool isTeamCaptain,
    required CourtSlot baseCourtSlot,
    required double courtTicketPrice,
    BuildContext? context,
  }) async {
    if (isTeamCaptain) {
      await courtSlotRepo.addTeamToCourtSlot(
        teamId: teamId,
        courtSlot: baseCourtSlot,
        courtTicketPrice: courtTicketPrice,
      );
      if (context != null) Navigator.pop(context);
    } else {
      Fluttertoast.showToast(
        msg: 'Only the team captain can join a game for the team',
      );
    }
  }

  Future<void> removeTeamFromCourtSlot({
    required String teamId,
    required bool isTeamCaptain,
    required CourtSlot baseCourtSlot,
    required double courtTicketPrice,
    BuildContext? context,
  }) async {
    if (isTeamCaptain) {
      await courtSlotRepo.removeTeamFromCourtSlot(
        teamId: teamId,
        courtSlot: baseCourtSlot,
        courtTicketPrice: courtTicketPrice,
      );
      if (context != null) Navigator.pop(context);
    } else {
      Fluttertoast.showToast(
        msg: 'Only the team captain can leave a game for the team',
      );
    }
  }

  Future<void> votePlayerAsMvp({
    required CourtSlot baseCourtSlot,
    required KasadoUser currentPlayer,
    required KasadoUser myMvp,
  }) async {
    assert(baseCourtSlot.hasPlayer(myMvp));
    final slotPlayers = baseCourtSlot.players;
    final currentPlayerIndex = slotPlayers.indexOf(currentPlayer);
    final myMvpIndex = slotPlayers.indexOf(myMvp);

    final isVoteForSelf = myMvpIndex == currentPlayerIndex;

    await courtSlotRepo.pushCourtSlot(
      courtSlot: baseCourtSlot.copyWith(
        players: (isVoteForSelf)
            ? (slotPlayers
              ..[currentPlayerIndex] = currentPlayer.copyWith(
                mvpVoteCount: currentPlayer.mvpVoteCount + 1,
                votedMvpId: currentPlayer.id,
              ))
            : (slotPlayers
              ..[currentPlayerIndex] =
                  currentPlayer.copyWith(votedMvpId: myMvp.id)
              ..[myMvpIndex] =
                  myMvp.copyWith(mvpVoteCount: myMvp.mvpVoteCount + 1)),
      ),
    );

    // TODO: Optimize and clean code IF and ONLY IF this clicks with users
    final userInfoBase = await userInfoRepo.getUserInfo(myMvp.id);
    userInfoRepo.updateUserOverviewStats(
      userId: myMvp.id,
      stats: OverviewStats(
        mvpVoteCount: userInfoBase!.overviewStats.mvpVoteCount + 1,
      ),
    );
  }
}
