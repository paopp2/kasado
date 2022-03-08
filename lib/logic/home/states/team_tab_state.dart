import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';

final teamUserInfoList = StateProvider.autoDispose((ref) {
  final currentUserInfo = ref.watch(currentUserInfoProvider).value!;
  return [currentUserInfo];
});
