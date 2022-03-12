import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/team_repository.dart';
import 'package:kasado/model/team/team.dart';

final teamPlayersListProvider = StateProvider.autoDispose((ref) {
  final currentUser = ref.watch(currentUserProvider)!;
  return [currentUser];
});

final teamStreamProvider = StreamProvider.autoDispose.family<Team?, String?>(
  (ref, teamId) {
    if (teamId == null) return Stream.value(null);
    final teamRepo = ref.watch(teamRepositoryProvider);
    return teamRepo.getTeamStream(teamId);
  },
);
