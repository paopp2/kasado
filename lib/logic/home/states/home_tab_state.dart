import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/home/home_view_model.dart';

final courtsStreamProvider = StreamProvider.autoDispose(
  (ref) => ref.watch(homeViewModel).getCourtsStream(),
);
