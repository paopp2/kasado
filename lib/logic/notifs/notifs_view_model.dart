import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/notifs/notifs_tec_mixin.dart';
import 'package:kasado/logic/shared/view_model.dart';

final notifsViewModel = Provider.autoDispose(
  (ref) => NotifsViewModel(
    read: ref.read,
  ),
);

class NotifsViewModel extends ViewModel with NotifsTecMixin {
  NotifsViewModel({
    required Reader read,
  }) : super(read);

  @override
  Future<void> initState([Map<String, Object?>? params]) async {
    FirebaseAnalytics.instance.logEvent(name: 'notifs_view');
  }
}
