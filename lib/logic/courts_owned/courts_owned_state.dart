import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedChipIndicesProvider =
    StateProvider.autoDispose<List<int>>((ref) => []);
