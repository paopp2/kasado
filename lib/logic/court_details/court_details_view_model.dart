import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

final courtDetailsViewModel = Provider.autoDispose(
  (ref) => CourtDetailsViewModel(
    read: ref.read,
    courtRepo: ref.watch(courtRepositoryProvider),
    currentUser: ref.watch(currentUserProvider)!,
  ),
);

class CourtDetailsViewModel extends ViewModel {
  CourtDetailsViewModel({
    required Reader read,
    required this.courtRepo,
    required this.currentUser,
  }) : super(read);

  final CourtRepository courtRepo;
  final KasadoUser currentUser;

  Future<void> joinCourtSlot(
    BuildContext context,
    CourtSlot baseCourtSlot,
  ) async {
    if (baseCourtSlot.isFull) {
      Fluttertoast.showToast(msg: 'Slot is full');
    } else if (baseCourtSlot.hasPlayer(currentUser)) {
      Fluttertoast.showToast(msg: 'Player already reserved');
    } else {
      await courtRepo.pushCourtSlot(
        courtSlot: baseCourtSlot.copyWith(
          players: baseCourtSlot.players..add(currentUser),
        ),
      );
      Navigator.pop(context);
    }
  }
}
