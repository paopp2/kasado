import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final userInfoStreamProvider =
    StreamProvider.autoDispose.family<KasadoUserInfo?, String>(
  (ref, userId) {
    final userInfoRepo = ref.watch(userInfoRepositoryProvider);
    return userInfoRepo.getUserInfoStream(userId);
  },
);