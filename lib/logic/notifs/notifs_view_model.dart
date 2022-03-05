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

  Future<void> onLikePressed({
    required Notif notif,
    required NotifMeta notifMeta,
    required ValueNotifier<bool> hasBeenPressed,
    required ValueNotifier<bool> hasDislikeBeenPressed,
  }) async {
    if (hasDislikeBeenPressed.value) {
      await giveFeedback(
        notifMeta: notifMeta,
        isLike: false,
        isAdd: false,
      );
      hasDislikeBeenPressed.value = false;
    }
    await giveFeedback(
      notifMeta: notifMeta,
      isLike: true,
      isAdd: !hasBeenPressed.value,
    );
    hasBeenPressed.value = !hasBeenPressed.value;
    setUserFeedbackState(
      notif: notif,
      hasLikeBeenPressed: hasBeenPressed,
      hasDislikeBeenPressed: hasDislikeBeenPressed,
    );
  }

  Future<void> onDislikePressed({
    required Notif notif,
    required NotifMeta notifMeta,
    required ValueNotifier<bool> hasBeenPressed,
    required ValueNotifier<bool> hasLikeBeenPressed,
  }) async {
    if (hasLikeBeenPressed.value) {
      await giveFeedback(
        notifMeta: notif,
        isLike: true,
        isAdd: false,
      );
      hasLikeBeenPressed.value = false;
    }
    await giveFeedback(
      notifMeta: notif,
      isLike: false,
      isAdd: !hasBeenPressed.value,
    );
    hasBeenPressed.value = !hasBeenPressed.value;
    setUserFeedbackState(
      notif: notif,
      hasLikeBeenPressed: hasLikeBeenPressed,
      hasDislikeBeenPressed: hasBeenPressed,
    );
  }

  Future<void> setUserFeedbackState({
    required Notif notif,
    required ValueNotifier<bool> hasLikeBeenPressed,
    required ValueNotifier<bool> hasDislikeBeenPressed,
  }) async {
    final isLiked = hasLikeBeenPressed.value;
    final isDisliked = hasDislikeBeenPressed.value;
    await notifRepo.setUserNotifFeedbackState(
      userId: currentUser.id,
      notif: notif as NotifObject,
      hasLiked: !(isLiked || isDisliked) ? null : isLiked,
    );
  }

  Future<void> giveFeedback({
    required Notif notifMeta,
    required bool isLike,
    required bool isAdd,
  }) async {
    await notifRepo.setUserFeedback(
      notifId: notifMeta.id,
      isLike: isLike,
      isAdd: isAdd,
    );
  }

  void setYesNoFeedbackEnabled(bool isEnabled) {
    read(isYesNoEnabledProvider.notifier).state = isEnabled;
  }

  Future<void> deleteNotif(Notif notif) async {
    await notifRepo.deleteNotifForAll(notif.id);
  }

  Future<void> pushNotifications(BuildContext context) async {
    await notifRepo.sendNotifToAll(
      notif: Notif(
        id: const Uuid().v4(),
        title: tecNotifTitle.text,
        body: tecNotifBody.text,
        sentAt: DateTime.now(),
        sender: currentUser,
      ),
      needsFeedback: read(isYesNoEnabledProvider),
    );
    Navigator.pop(context);
  }
}
