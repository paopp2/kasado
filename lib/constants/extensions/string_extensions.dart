extension StringExtensions on String {
  /// Returns the first name (eg. John Doe -> John)
  String get firstName => split(' ').first;

  /// Returns the last name (eg. John Doe -> Doe)
  String get lastName => split(' ').last;

  /// Capitalize this String (eg. hello -> Hello)
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';

  /// Splits this String address into two: the first being the more 'specific',
  /// the other one the more 'general' (eg. ['USC-TC', 'Talamban Cebu'])
  List<String> splitAddress() {
    final index = indexOf(",");

    return index != -1
        ? [substring(0, index).trim(), substring(index + 1).trim()]
        : [this, "Philippines"];
  }
}
