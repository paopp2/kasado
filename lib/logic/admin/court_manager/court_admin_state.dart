import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/court_repository.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

final selectedSchedChipIndicesProvider = StateProvider.autoDispose<List<int>>(
  (ref) {
    ref.maintainState = true;

    return [];
  },
);

final selectedDayChipIndicesProvider = StateProvider.autoDispose<List<int>>(
  (ref) {
    ref.maintainState = true;

    return [];
  },
);

final courtsOwnedListProvider = StreamProvider.autoDispose(
  (ref) {
    final currentUser = ref.watch(currentUserProvider);

    return ref
        .watch(courtRepositoryProvider)
        .getCourtsStream(admin: currentUser);
  },
);

final courtAdminsListProvider =
    StreamProvider.autoDispose.family<List<KasadoUser>, String>(
  (ref, courtRawJson) {
    final Court court = Court.fromJson(jsonDecode(courtRawJson));

    return ref.watch(userInfoRepositoryProvider).getCourtAdmins(court);
  },
);
