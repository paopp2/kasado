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
    ref: ref,
    currentUser: ref.watch(currentUserProvider)!,
    notifRepo: ref.watch(notifRepositoryProvider),
  ),
);

class NotifsViewModel extends ViewModel with NotifsTecMixin {
  NotifsViewModel({
    required Ref ref,
    required this.currentUser,
    required this.notifRepo,
  }) : super(ref);

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

  // Decrease dislike count when disliked, add to like count and set notif to liked
  // Split with onDislikePressed despite having more or less the same logic for
  // the sake of readability
  // TODO: Fix lag when liking at dislike state (and vice-versa for onDislikePressed)
  Future<void> onLikePressed({
    required Notif notif,
    required NotifMeta notifMeta,
    required bool? wasLiked,
  }) async {
    if (wasLiked == false) {
      await giveFeedback(
        notifMeta: notifMeta,
        isLike: false,
        isAdd: false,
      );
    }
    giveFeedback(
      notifMeta: notifMeta,
      isLike: true,
      isAdd: (wasLiked == null || !wasLiked),
    );
    setUserFeedbackState(
      notif: notif,
      isLiked: (wasLiked == true) ? null : true,
    );
  }

  // Decrease like count when liked, add to dislike count and set notif to liked
  // Split with onLikePressed despite having more or less the same logic for the
  // sake of readability
  Future<void> onDislikePressed({
    required Notif notif,
    required NotifMeta notifMeta,
    required bool? wasLiked,
  }) async {
    if (wasLiked == true) {
      await giveFeedback(
        notifMeta: notifMeta,
        isLike: true,
        isAdd: false,
      );
    }
    giveFeedback(
      notifMeta: notifMeta,
      isLike: false,
      isAdd: (wasLiked == null || wasLiked),
    );
    setUserFeedbackState(
      notif: notif,
      isLiked: (wasLiked == false) ? null : false,
    );
  }

  Future<void> setUserFeedbackState({
    required Notif notif,
    bool? isLiked,
  }) async {
    final String action = (isLiked == null)
        ? "Cancelled"
        : (isLiked)
            ? "Liked"
            : "Disliked";
    ref.read(mixpanel)!.track(
      "$action notif",
      properties: {
        "notifTitle": notif.title,
      },
    );
    await notifRepo.setUserNotifFeedbackState(
      userId: currentUser.id,
      notif: notif as NotifObject,
      hasLiked: isLiked,
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
    ref.read(isYesNoEnabledProvider.notifier).state = isEnabled;
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
      needsFeedback: ref.read(isYesNoEnabledProvider),
    );
    Navigator.pop(context);
  }
}
