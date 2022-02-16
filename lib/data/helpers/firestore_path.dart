import 'dart:core';

class FirestorePath {
  // COLLECTION paths
  static String colCourts() => 'courts';
  static String colCourtSlots(String courtId) => 'courts/$courtId/court_slots';

  // DOCUMENT paths
  static String docCourt(String courtId) => 'courts/$courtId';
}
