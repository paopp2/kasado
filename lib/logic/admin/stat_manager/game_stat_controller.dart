import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/stat_manager/game_stat_state.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

final gameStatController = Provider.autoDispose(
  (ref) => GameStatController(read: ref.read),
);

class GameStatController {
  GameStatController({required this.read});
  final Reader read;

  void addPlayerToHomeTeam(KasadoUser player) {
    read(homeTeamPlayersProvider.notifier)
        .update((state) => [...state, player]);
  }

  void addPlayerToAwayTeam(KasadoUser player) {
    read(awayTeamPlayersProvider.notifier)
        .update((state) => [...state, player]);
  }
}
