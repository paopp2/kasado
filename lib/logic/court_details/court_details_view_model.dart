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

  Future<void> joinCourtSlot({
    required String courtId,
    required CourtSlot courtSlot,
  }) async {
    await courtRepo.addPlayerForCourtSlot(
      player: currentUser,
      courtId: courtId,
      courtSlot: courtSlot,
    );
  }
}
