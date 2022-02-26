import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/shared/view_model.dart';

final playerManagerViewModel = Provider.autoDispose(
  (ref) => PlayerManagerViewModel(read: ref.read),
);

class PlayerManagerViewModel extends ViewModel {
  PlayerManagerViewModel({
    required Reader read,
  }) : super(read);
}
