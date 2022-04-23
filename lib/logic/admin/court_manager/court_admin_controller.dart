import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/data/repositories/court_slot_repository.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_state.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_tec_mixin.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_sched/court_sched.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
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

  void addToCourtSchedList({
    required CourtSched sched,
    required bool isSpecial,
  }) {
    final schedListProvider =
        (isSpecial) ? specialCourtSchedListProvider : courtSchedListProvider;
    read(schedListProvider.notifier).update(
      (s) => [...s, sched]..sort(
          (a, b) {
            return a.weekdayIndex != b.weekdayIndex
                ? a.weekdayIndex.compareTo(b.weekdayIndex)
                : a.timeRange.startsAt.compareTo(b.timeRange.startsAt);
          },
        ),
    );
  }

  void removeFromCourtSchedList({
    required CourtSched sched,
    required bool isSpecial,
  }) {
    final schedListProvider =
        (isSpecial) ? specialCourtSchedListProvider : courtSchedListProvider;
    read(schedListProvider.notifier).update(
      (s) => [...s]..remove(sched),
    );
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
      setupCourtToEdit(court!, (courtScheds, specialCourtScheds) {
        read(courtSchedListProvider.notifier).state = courtScheds;
        read(specialCourtSchedListProvider.notifier).state = specialCourtScheds;
      });
    }
    showDialog(
      context: context,
      builder: (_) => dialog,
    ).then((_) {
      read(courtSchedListProvider.notifier).state = [];
      read(courtSchedListProvider.notifier).state = [];
      clearAllTecs();
    });
  }

  /// If (isEdit), courtId must not be null
  Future<void> pushCourt({
    required BuildContext context,
    bool isEdit = false,
    String? courtId,
  }) async {
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
        adminIds: baseCourtInfo?.adminIds ?? [currentUser.id],
        courtScheds: read(courtSchedListProvider),
        specialCourtScheds: read(specialCourtSchedListProvider),
      ),
      isUpdate: isEdit,
    );

    Navigator.pop(context);
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
