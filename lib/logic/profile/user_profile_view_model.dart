import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/shared/view_model.dart';

final userProfileViewModel = Provider.autoDispose(
  (ref) => UserProfileViewModel(
    read: ref.read,
  ),
);

class UserProfileViewModel extends ViewModel {
  UserProfileViewModel({
    required Reader read,
  }) : super(read);
}
