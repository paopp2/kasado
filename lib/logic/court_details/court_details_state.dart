import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/model/court_slot/court_slot.dart';

final courtSlotsStreamProvider =
    StreamProvider.autoDispose.family<List<CourtSlot>, String>(
  (ref, courtId) => ref.watch(courtRepositoryProvider).getCourtSlots(courtId),
);
