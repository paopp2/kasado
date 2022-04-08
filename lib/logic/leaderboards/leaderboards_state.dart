import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums.dart';
import 'package:kasado/data/repositories/stat_repository.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final statLeadersStreamProvider = StreamProvider.autoDispose
    .family<List<KasadoUserInfo>, StatType>((ref, statType) {
  final statRepo = ref.watch(statRepositoryProvider);
  switch (statType) {
    case StatType.winRate:
      return statRepo.getWinRateLeadersStream();
    case StatType.ptsPerGame:
      return statRepo.getPpgLeadersStream();
    case StatType.astPerGame:
      return statRepo.getApgLeadersStream();
    case StatType.rebPerGame:
      return statRepo.getRpgLeadersStream();
    case StatType.blkPerGame:
      return statRepo.getBpgLeadersStream();
    case StatType.stlPerGame:
      return statRepo.getSpgLeadersStream();
    case StatType.fgPercent:
      return statRepo.getFgPercentLeadersStream();
    case StatType.threePtPercent:
      return statRepo.get3ptPercentLeadersStream();
    case StatType.threePtMade:
      return statRepo.get3ptMadeLeadersStream();
  }
});
