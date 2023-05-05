import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ViewModel {
  ViewModel(this.ref);
  final Ref ref;

  // ignore: no-empty-block, optionally implemented by children
  void initState([Map<String, Object?>? params]) {}
  // ignore: no-empty-block, optionally implemented by children
  void dispose() {}
}
