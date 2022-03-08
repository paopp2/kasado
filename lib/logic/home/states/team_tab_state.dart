import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/team_repository.dart';
import 'package:kasado/model/team/team.dart';

final teamUserInfoListProvider = StateProvider.autoDispose((ref) {
  final currentUserInfo = ref.watch(currentUserInfoProvider).value!;
  return [currentUserInfo];
});

final teamStreamProvider = StreamProvider.autoDispose.family<Team?, String>(
  (ref, teamId) {
    final teamRepo = ref.watch(teamRepositoryProvider);
    return teamRepo.getTeamStream(teamId);
  },
);
