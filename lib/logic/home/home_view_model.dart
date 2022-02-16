import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/data/services/auth_service.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/court/court.dart';

final homeViewModel = Provider.autoDispose(
  (ref) => HomeViewModel(
    read: ref.read,
    authService: ref.watch(authServiceProvider),
    courtRepo: ref.watch(courtRepositoryProvider),
  ),
);

class HomeViewModel extends ViewModel {
  HomeViewModel({
    required Reader read,
    required this.authService,
    required this.courtRepo,
  }) : super(read);

  final AuthService authService;
  final CourtRepository courtRepo;

  Future<void> signOut() async => await authService.signOutGoogle();

  Stream<List<Court>> getCourtsStream() => courtRepo.getCourtsStream();
}
