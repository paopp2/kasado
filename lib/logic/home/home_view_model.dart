import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/current_app_meta.dart';
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
  Future<void> initState([Map<String, Object?>? params]) async {
    FirebaseAnalytics.instance.logEvent(
      name: 'home_view',
      parameters: {'user_id': currentUser.toJson().toString()},
    );
    read(mixpanel)!
      ..identify(currentUser.id)
      ..getPeople().set("\$email", currentUser.email)
      ..getPeople().set("\$name", currentUser.displayName)
      ..getPeople().set("kasadoVersion", currentVersion);
    await userInfoRepo.pushUserInfoIfNonExistent(currentUser);

    final isWebDesktop = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.linux ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.macOS);
    if (isWebDesktop) {
      read(mixpanel)!.track("Viewed warning for using app on desktop");
      AwesomeDialog(
        context: params!['context'] as BuildContext,
        dialogType: DialogType.WARNING,
        title: "Web app not yet optimized for desktop",
        desc: "Pasidaan lang pre, bisan tuod mugana ra diri, kiwaw pa gamay "
            "tan-awn sa desktop kay sa mobile pa gifocus ang design. Adjust-on "
            "ra nya ni namo puhon",
        width: 750,
      ).show();
    }
  }

  Future<void> signOut() async => await authService.signOutGoogle();
}
