import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/services/auth_service.dart';
import 'package:kasado/logic/shared/view_model.dart';

final homeViewModel = Provider.autoDispose(
  (ref) => HomeViewModel(
    read: ref.read,
    authService: ref.watch(authServiceProvider),
  ),
);

class HomeViewModel extends ViewModel {
  HomeViewModel({
    required Reader read,
    required this.authService,
  }) : super(read);

  final AuthService authService;

  Future<void> signOut() async => await authService.signOutGoogle();
}
