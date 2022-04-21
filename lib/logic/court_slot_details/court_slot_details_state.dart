import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/court_slot_repository.dart';
import 'package:kasado/model/court_slot/court_slot.dart';

/// For combinedPathIds, follow the following format: "[courtId]|[slotId]"
///
/// Reason: For consistent hashcode as per the Riverpod's .family documentation
final courtSlotStreamProvider = StreamProvider.autoDispose
    .family<CourtSlot?, String>((ref, combinedPathIds) {
  final List<String> pathIdList = combinedPathIds.split('|');

  return ref
      .watch(courtSlotRepositoryProvider)
      .getCourtSlotStream(pathIdList[0], pathIdList[1]);
});
