import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/notifs/notifs_state.dart';
import 'package:kasado/logic/notifs/notifs_tec_mixin.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/notif/notif.dart';
import 'package:uuid/uuid.dart';

final notifsViewModel = Provider.autoDispose(
  (ref) => NotifsViewModel(
    read: ref.read,
    currentUser: ref.watch(currentUserProvider)!,
  ),
);

class NotifsViewModel extends ViewModel with NotifsTecMixin {
  NotifsViewModel({
    required Reader read,
    required this.currentUser,
  }) : super(read);

  final KasadoUser currentUser;

  @override
  Future<void> initState([Map<String, Object?>? params]) async {
    FirebaseAnalytics.instance.logEvent(name: 'notifs_view');
  }

  void setYesNoFeedbackEnabled(bool isEnabled) {
    read(isYesNoEnabledProvider.notifier).state = isEnabled;
  }

  Future<void> pushNotifications() async {
    final notif = Notif(
      id: const Uuid().v4(),
      title: tecNotifTitle.text,
      body: tecNotifBody.text,
      sendToAll: true,
      sentAt: DateTime.now(),
      getFeedback: read(isYesNoEnabledProvider),
      sender: currentUser,
    );
    print(notif);
  }
}
