import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/courts_owned/courts_owned_state.dart';
import 'package:kasado/logic/shared/view_model.dart';

final courtsOwnedViewModel = Provider.autoDispose(
  (ref) => CourtsOwnedViewModel(
    read: ref.read,
  ),
);

class CourtsOwnedViewModel extends ViewModel {
  CourtsOwnedViewModel({
    required Reader read,
  }) : super(read);

  void selectSchedChip(bool isSelected, int index) {
    read(selectedChipIndicesProvider.notifier).update((s) {
      if (isSelected) {
        return [...s, index];
      } else {
        return [...s]..remove(index);
      }
    });
  }

  bool isSchedIndexSelected(int index) {
    return read(selectedChipIndicesProvider).contains(index);
  }
}
