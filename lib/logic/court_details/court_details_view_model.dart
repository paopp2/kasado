import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/logic/shared/view_model.dart';

final courtDetailsViewModel = Provider.autoDispose(
  (ref) => CourtDetailsViewModel(
    read: ref.read,
    courtRepo: ref.watch(courtRepositoryProvider),
  ),
);

class CourtDetailsViewModel extends ViewModel {
  CourtDetailsViewModel({
    required Reader read,
    required this.courtRepo,
  }) : super(read);

  final CourtRepository courtRepo;

  Future<void> joinCourtSlot() async {}
}
