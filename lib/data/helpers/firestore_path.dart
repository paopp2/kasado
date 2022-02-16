import 'dart:core';

class FirestorePath {
  // COLLECTION paths
  static String colCourts() => 'courts';

  // DOCUMENT paths
  static String docCourt(String courtId) => 'courts/$courtId';
}
