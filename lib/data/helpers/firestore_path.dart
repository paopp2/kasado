import 'dart:core';

class FirestorePath {
  // COLLECTION paths
  static String colCourts() => 'courts';
  static String colCourtSlots(String courtId) => 'courts/$courtId/court_slots';
  static String colUserInfos() => 'user_info';

  // DOCUMENT paths
  static String docCourt(String courtId) => 'courts/$courtId';
  static String docCourtSlot(String courtId, String slotId) =>
      'courts/$courtId/court_slots/$slotId';
  static String docUserInfo(String userId) => 'user_info/$userId';
}
