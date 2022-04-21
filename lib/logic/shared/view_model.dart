import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ViewModel {
  ViewModel(this.read);
  final Reader read;

  // ignore: no-empty-block, optionally implemented by children
  void initState([Map<String, Object?>? params]) {}
  // ignore: no-empty-block, optionally implemented by children
  void dispose() {}
}
