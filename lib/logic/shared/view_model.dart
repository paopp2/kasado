import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ViewModel {
  ViewModel(this.read);
  final Reader read;

  void initState([Map<String, Object?>? params]) {}
  void dispose() {}
}
