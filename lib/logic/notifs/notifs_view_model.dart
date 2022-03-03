import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/notif_repository.dart';
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
    notifRepo: ref.watch(notifRepositoryProvider),
  ),
);

class NotifsViewModel extends ViewModel with NotifsTecMixin {
  NotifsViewModel({
    required Reader read,
    required this.currentUser,
    required this.notifRepo,
  }) : super(read);

  final KasadoUser currentUser;
  final NotifRepository notifRepo;

  @override
  Future<void> initState([Map<String, Object?>? params]) async {
    FirebaseAnalytics.instance.logEvent(name: 'notifs_view');
  }

  @override
  Future<void> dispose() async {
    notifRepo.setUnreadUserNotifsAsRead(userId: currentUser.id);
  }

  Future<void> setFeedback({
    required String userId,
    required Notif notif,
    required bool isPositive,
  }) async {
    await notifRepo.setUserFeedback(notifId: notif.id, isPositive: isPositive);
    await notifRepo.setUserNotifAsRead(userId: userId, notif: notif);
  }

  void setYesNoFeedbackEnabled(bool isEnabled) {
    read(isYesNoEnabledProvider.notifier).state = isEnabled;
  }

  Future<void> deleteNotif(Notif notif) async {
    await notifRepo.deleteNotifForAll(notif.id);
  }

  Future<void> pushNotifications(BuildContext context) async {
    await notifRepo.sendNotifToAll(
      Notif(
        id: const Uuid().v4(),
        title: tecNotifTitle.text,
        body: tecNotifBody.text,
        sentAt: DateTime.now(),
        needsFeedback: read(isYesNoEnabledProvider),
        sender: currentUser,
      ),
    );
    Navigator.pop(context);
  }
}
