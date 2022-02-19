import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final courtDetailsViewModel = Provider.autoDispose(
  (ref) => CourtDetailsViewModel(
    read: ref.read,
    courtRepo: ref.watch(courtRepositoryProvider),
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
    currentUser: ref.watch(currentUserProvider)!,
    currentUserInfo: ref.watch(currentUserInfoProvider).value,
  ),
);

class CourtDetailsViewModel extends ViewModel {
  CourtDetailsViewModel({
    required Reader read,
    required this.courtRepo,
    required this.userInfoRepo,
    required this.currentUser,
    required this.currentUserInfo,
  }) : super(read);

  final CourtRepository courtRepo;
  final UserInfoRepository userInfoRepo;
  final KasadoUser currentUser;
  final KasadoUserInfo? currentUserInfo;

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

  Future<void> joinCourtSlot(
    CourtSlot baseCourtSlot, [
    BuildContext? context,
  ]) async {
    if (baseCourtSlot.isFull) {
      Fluttertoast.showToast(msg: 'Slot is full');
    } else if (baseCourtSlot.hasPlayer(currentUser)) {
      Fluttertoast.showToast(msg: 'Player already reserved');
    } else if (currentUserInfo?.isReserved ?? true) {
      Fluttertoast.showToast(msg: 'Only 1 reservation allowed at a time');
    } else {
      await courtRepo.pushCourtSlot(
        courtSlot: baseCourtSlot.copyWith(
          players: baseCourtSlot.players..add(currentUser),
        ),
      );
      await userInfoRepo.toggleUserIsReservedStatus(currentUser.id);
      if (context != null) Navigator.pop(context);
    }
  }

  Future<void> leaveCourtSlot(
    CourtSlot baseCourtSlot, [
    BuildContext? context,
  ]) async {
    assert(baseCourtSlot.hasPlayer(currentUser));
    final updatedPlayerList = baseCourtSlot.players
      ..removeWhere((p) => (currentUser.id == p.id));
    await courtRepo.pushCourtSlot(
      courtSlot: baseCourtSlot.copyWith(players: updatedPlayerList),
    );
    await userInfoRepo.toggleUserIsReservedStatus(currentUser.id);
    if (updatedPlayerList.isEmpty) {
      await courtRepo.removeCourtSlot(
        baseCourtSlot.courtId,
        baseCourtSlot.slotId,
      );
    }

    if (context != null) Navigator.pop(context);
  }
}
