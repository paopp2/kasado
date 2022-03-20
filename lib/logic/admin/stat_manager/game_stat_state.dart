import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

final homeTeamPlayersProvider =
    StateProvider.autoDispose<List<KasadoUser>>((ref) => []);

final awayTeamPlayersProvider =
    StateProvider.autoDispose<List<KasadoUser>>((ref) => []);
