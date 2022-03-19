import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final courtDetailsViewModel = Provider.autoDispose(
  (ref) => CourtDetailsViewModel(
    read: ref.read,
    currentUser: ref.watch(currentUserProvider)!,
    currentUserInfo: ref.watch(currentUserInfoProvider).value,
    adminController: ref.watch(courtAdminController),
  ),
);

class CourtDetailsViewModel extends ViewModel {
  CourtDetailsViewModel({
    required Reader read,
    required this.adminController,
    required this.currentUser,
    required this.currentUserInfo,
  }) : super(read);

  final CourtAdminController adminController;
  final KasadoUser currentUser;
  final KasadoUserInfo? currentUserInfo;

  @override
  void initState([Map<String, Object?>? params]) {
    FirebaseAnalytics.instance.logEvent(
      name: 'court_details_view',
      parameters: {
        'user_id': currentUser.toJson().toString(),
        'user_info': currentUserInfo?.toJson().toString(),
        'court_id': params!['court_id'],
      },
    );
  }
}
