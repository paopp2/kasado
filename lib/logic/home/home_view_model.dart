import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/data/services/auth_service.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

final homeViewModel = Provider.autoDispose(
  (ref) => HomeViewModel(
    read: ref.read,
    authService: ref.watch(authServiceProvider),
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
    currentUser: ref.watch(currentUserProvider)!,
  ),
);

class HomeViewModel extends ViewModel {
  HomeViewModel({
    required Reader read,
    required this.authService,
    required this.userInfoRepo,
    required this.currentUser,
  }) : super(read);

  final AuthService authService;
  final UserInfoRepository userInfoRepo;
  final KasadoUser currentUser;

  @override
  Future<void> initState() async {
    await userInfoRepo.pushUserInfoIfNonExistent(currentUser);
  }

  Future<void> signOut() async => await authService.signOutGoogle();
}
