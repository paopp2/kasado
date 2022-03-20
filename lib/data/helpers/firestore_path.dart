import 'dart:core';

class FirestorePath {
  // COLLECTION paths
  static String colCourts() => 'courts';
  static String colCourtSlots(String courtId) => 'courts/$courtId/court_slots';
  static String colUserInfos() => 'user_info';
  static String colNotifs() => 'notifs';
  static String colUserNotifs(String userId) => 'user_info/$userId/notifs';
  static String colTeams() => 'teams';
  static String colGameStats(String courtId, String slotId) =>
      'courts/$courtId/court_slots/$slotId/stats';

  // DOCUMENT paths
  static String docAppMeta() => 'app_meta/app_meta';
  static String docCourt(String courtId) => 'courts/$courtId';
  static String docCourtSlot(String courtId, String slotId) =>
      'courts/$courtId/court_slots/$slotId';
  static String docUserInfo(String userId) => 'user_info/$userId';
  static String docNotif(String notifId) => 'notifs/$notifId';
  static String docUserNotif(String userId, String notifId) =>
      'user_info/$userId/notifs/$notifId';
  static String docTeam(String teamId) => 'teams/$teamId';
  static String docGameStats(String courtId, String slotId, String statsId) =>
      'courts/$courtId/court_slots/$slotId/stats/$statsId';
}
