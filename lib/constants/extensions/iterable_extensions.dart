extension IterableExtensions<E> on Iterable<E> {
  List<E> exclude(E element) => where((e) => e != element).toList();
  List<E> excludeWhere(bool Function(E element) test) =>
      where((e) => !test(e)).toList();
}
