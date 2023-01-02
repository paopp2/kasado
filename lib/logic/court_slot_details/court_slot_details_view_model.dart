import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/slot_and_user_state.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/data/repositories/court_slot_repository.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/data/repositories/team_repository.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:kasado/ui/shared/user_search/user_search_pane.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final courtSlotDetailsViewModel = Provider.autoDispose(
  (ref) => CourtSlotDetailsViewModel(
    ref: ref,
    courtRepo: ref.watch(courtRepositoryProvider),
    courtSlotRepo: ref.watch(courtSlotRepositoryProvider),
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
    teamRepo: ref.watch(teamRepositoryProvider),
    statRepo: ref.watch(statRepositoryProvider),
    currentUser: ref.watch(currentUserProvider)!,
    currentUserInfo: ref.watch(currentUserInfoProvider).value,
    utils: ref.watch(kasadoUtilsProvider),
  ),
);

class CourtSlotDetailsViewModel extends ViewModel {
  CourtSlotDetailsViewModel({
    required Ref ref,
    required this.courtRepo,
    required this.courtSlotRepo,
    required this.userInfoRepo,
    required this.teamRepo,
    required this.currentUser,
    required this.currentUserInfo,
    required this.utils,
    required this.statRepo,
  }) : super(ref);

  final CourtRepository courtRepo;
  final CourtSlotRepository courtSlotRepo;
  final UserInfoRepository userInfoRepo;
  final TeamRepository teamRepo;
  final StatRepository statRepo;
  final KasadoUser currentUser;
  final KasadoUserInfo? currentUserInfo;
  final KasadoUtils utils;

  @override
  void initState([Map<String, Object?>? params]) {
    FirebaseAnalytics.instance.logEvent(
      name: 'court_slot_details_view',
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

    final isSlotEnded = utils.isCurrentSlotEnded(courtSlot.timeRange);
    if (isSlotEnded) {
      return SlotAndUserState.slotEnded;
    } else if (courtSlot.isClosedByAdmin) {
      return SlotAndUserState.slotClosedByAdmin;
    } else if (courtSlot.isFull) {
      return SlotAndUserState.slotFull;
    } else if (user.isReservedHere(courtSlot)) {
      return SlotAndUserState.slotHasUser;
    } else if (user.hasSchedConflict(courtSlot)) {
      return SlotAndUserState.userHasConflictWithOtherSlot;
    } else {
      return SlotAndUserState.userAvailable;
    }
  }

  CourtSlot getBaseCourtSlot({
    required Appointment appointment,
    required Court court,
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
        courtId: court.id,
        courtName: court.name,
        ticketPrice: court.ticketPrice,
        slotId: CourtSlot.getIdFromTimeRange(aTimeRange),
        timeRange: aTimeRange,
        maxPlayerCount: court.maxPerSlot,
        minPlayerCount: court.minPerSlot,
      ),
    );
  }

  Future<void> joinAsAnotherPlayer({
    required BuildContext context,
    required CourtSlot baseCourtSlot,
    required Future<bool> Function() onNotEnoughPondo,
  }) async {
    final playerUserInfo = await showDialog(
      context: context,
      builder: (_) => Dialog(
        child: UserSearchPane(
          onUserTapped: (userInfo) => Navigator.pop(context, userInfo),
        ),
      ),
    );
    if (playerUserInfo == null) return;
    await addToCourtSlot(
      userInfo: playerUserInfo,
      baseCourtSlot: baseCourtSlot,
      onNotEnoughPondo: onNotEnoughPondo,
    );
  }

  /// Join/Leave [baseCourtSlot] depending on whether [slotHasPlayer] for self
  Future<void> joinLeaveCourtSlot({
    required CourtSlot baseCourtSlot,
    required bool slotHasPlayer,
    required String? teamId,
    required bool isTeamCaptain,
    required Future<bool> Function() onUserDontHaveEnoughPondo,
    required Future<bool> Function(List<KasadoUserInfo>) onNotAllHasEnoughPondo,
  }) async {
    if (teamId == null) {
      // If player is not part of a team
      if (slotHasPlayer) {
        await removeFromCourtSlot(
          playerToRemove: currentUserInfo!.user,
          baseCourtSlot: baseCourtSlot,
        );
      } else {
        await addToCourtSlot(
          userInfo: currentUserInfo!,
          baseCourtSlot: baseCourtSlot,
          onNotEnoughPondo: onUserDontHaveEnoughPondo,
        );
      }
    } else {
      // If player is part of a team
      if (slotHasPlayer) {
        await removeTeamFromCourtSlot(
          teamId: teamId,
          teamCaptainInfo: currentUserInfo!,
          isTeamCaptain: isTeamCaptain,
          baseCourtSlot: baseCourtSlot,
        );
      } else {
        await addTeamToCourtSlot(
          teamId: teamId,
          teamCaptainInfo: currentUserInfo!,
          isTeamCaptain: isTeamCaptain,
          baseCourtSlot: baseCourtSlot,
          onNotAllHasEnoughPondo: onNotAllHasEnoughPondo,
        );
      }
    }
  }

  Future<void> addToCourtSlot({
    required KasadoUserInfo userInfo,
    required CourtSlot baseCourtSlot,
    required Future<bool> Function() onNotEnoughPondo,
  }) async {
    ref.read(mixpanel)!.track("Join a courtSlot", properties: {
      "isSingle": true,
      "courtName": baseCourtSlot.courtName,
      "courtSlotTimeRange": utils.getTimeRangeFormat(
        baseCourtSlot.timeRange,
        showDate: true,
      )
    });
    await getSlotAndUserState(baseCourtSlot).when(
      slotFull: () => Fluttertoast.showToast(msg: 'Slot is full'),
      slotClosedByAdmin: () =>
          Fluttertoast.showToast(msg: 'Slot is closed by Admin'),
      userHasConflictWithOtherSlot: () => Fluttertoast.showToast(
        msg: "In conflict with another slot you are reserved at",
      ),
      orElse: () async {
        // Add user to courtSlot
        await courtSlotRepo.addPlayerToCourtSlot(
          courtSlot: baseCourtSlot,
          player: userInfo.user,
          onNotEnoughPondo: onNotEnoughPondo,
        );
      },
    );
  }

  Future<void> removeFromCourtSlot({
    required KasadoUser playerToRemove,
    required CourtSlot baseCourtSlot,
  }) async {
    ref.read(mixpanel)!.track("Leave a courtSlot", properties: {
      "isSingle": true,
      "courtName": baseCourtSlot.courtName,
      "courtSlotTimeRange": utils.getTimeRangeFormat(
        baseCourtSlot.timeRange,
        showDate: true,
      )
    });

    final KasadoUser player =
        baseCourtSlot.players.firstWhere((p) => (p.id == playerToRemove.id));

    await courtSlotRepo.removePlayerFromCourtSlot(
      player: player,
      courtSlot: baseCourtSlot,
    );
  }

  Future<void> addTeamToCourtSlot({
    required String teamId,
    required bool isTeamCaptain,
    required KasadoUserInfo teamCaptainInfo,
    required CourtSlot baseCourtSlot,
    required Future<bool> Function(List<KasadoUserInfo>) onNotAllHasEnoughPondo,
  }) async {
    ref.read(mixpanel)!.track("Join a courtSlot", properties: {
      "isSingle": false,
      "courtName": baseCourtSlot.courtName,
      "courtSlotTimeRange": utils.getTimeRangeFormat(
        baseCourtSlot.timeRange,
        showDate: true,
      )
    });
    await getSlotAndUserState(baseCourtSlot).when(
      // TODO: Should only be for the team captain
      userHasConflictWithOtherSlot: () => Fluttertoast.showToast(
        msg: "In conflict with another slot the team is reserved at",
      ),
      slotClosedByAdmin: () =>
          Fluttertoast.showToast(msg: 'Slot is closed by Admin'),
      orElse: () async {
        if (isTeamCaptain) {
          await courtSlotRepo.addTeamToCourtSlot(
            teamId: teamId,
            teamCaptainInfo: teamCaptainInfo,
            courtSlot: baseCourtSlot,
            onTeamCantFit: () => Fluttertoast.showToast(
              msg:
                  "Your team can't fit for this slot, please choose another one",
            ),
            onNotAllHasEnoughPondo: onNotAllHasEnoughPondo,
          );
        } else {
          Fluttertoast.showToast(
            msg: 'Only the team captain can join a game for the team',
          );
        }
      },
    );
  }

  Future<void> removeTeamFromCourtSlot({
    required String teamId,
    required KasadoUserInfo teamCaptainInfo,
    required bool isTeamCaptain,
    required CourtSlot baseCourtSlot,
    BuildContext? context,
  }) async {
    ref.read(mixpanel)!.track("Leave a courtSlot", properties: {
      "isSingle": false,
      "courtName": baseCourtSlot.courtName,
      "courtSlotTimeRange": utils.getTimeRangeFormat(
        baseCourtSlot.timeRange,
        showDate: true,
      )
    });
    if (isTeamCaptain) {
      await courtSlotRepo.removeTeamFromCourtSlot(
        teamId: teamId,
        teamCaptainInfo: teamCaptainInfo,
        courtSlot: baseCourtSlot,
      );
      if (context != null) Navigator.pop(context);
    } else {
      Fluttertoast.showToast(
        msg: 'Only the team captain can leave a game for the team',
      );
    }
  }
}
