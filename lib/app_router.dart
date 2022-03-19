import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/admin/player_manager/player_manager_view.dart';
import 'package:kasado/ui/auth/login_view.dart';
import 'package:kasado/ui/court_details/court_details_view.dart';
import 'package:kasado/ui/admin/court_manager/courts_owned_view.dart';
import 'package:kasado/ui/court_slot_details/court_slot_details_view.dart';
import 'package:kasado/ui/home/home_view.dart';
import 'package:kasado/ui/notifs/notifs_view.dart';
import 'package:kasado/ui/profile/user_profile_view.dart';

class AppRouter {
  AppRouter._();
  static final instance = AppRouter._();
  final fireAuthInstance = FirebaseAuth.instance;
  late final router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.loginView,
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        name: Routes.homeView,
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        name: Routes.courtsOwnedView,
        path: '/courts-owned',
        builder: (context, state) => const CourtsOwnedView(),
      ),
      GoRoute(
        name: Routes.courtDetailsView,
        path: '/court-details/:courtId',
        builder: (context, state) {
          final isAdmin = state.extra as bool?;
          return CourtDetailsView(
            courtId: state.params['courtId']!,
            isAdmin: (isAdmin ?? false),
          );
        },
      ),
      GoRoute(
        name: Routes.courtSlotDetailsView,
        path: '/slot-details',
        builder: (context, state) {
          final extraMap = state.extra as Map<String, Object?>;
          return CourtSlotDetailsView(
            isAdmin: extraMap['isAdmin']! as bool,
            baseCourtSlot: extraMap['baseCourtSlot']! as CourtSlot,
            court: extraMap['court']! as Court,
            isDone: extraMap['isDone']! as bool,
          );
        },
      ),
      GoRoute(
        name: Routes.userProfileView,
        path: '/user-profile-view/:uid',
        builder: (context, state) => UserProfileView(
          userId: state.params['uid']!,
        ),
      ),
      GoRoute(
        name: Routes.playerManagerView,
        path: '/player-manager-view',
        builder: (context, state) => const PlayerManagerView(),
      ),
      GoRoute(
        name: Routes.notifsView,
        path: '/notifs',
        builder: (context, state) {
          final extraMap = state.extra as Map<String, Object?>;
          return NotifsView(
            userId: extraMap['userId'] as String,
            isSuperAdmin: (extraMap['isSuperAdmin'] as bool?) ?? false,
          );
        },
      ),
    ],
    redirect: (state) {
      final isLoggedIn = fireAuthInstance.currentUser != null;
      final loggingIn = state.subloc == '/login';

      // If the user is not logged in, they must login
      if (!isLoggedIn) return loggingIn ? null : '/login';

      // If the user is logged in but still on LoginView, send them to
      // the HomeView
      if (loggingIn) return '/';

      // No need to redirect at all
      return null;
    },
    refreshListenable: GoRouterRefreshStream(
      fireAuthInstance.authStateChanges(),
    ),
  );
}

class Routes {
  static const homeView = 'home_view';
  static const loginView = 'login_view';
  static const courtDetailsView = 'court_details_view';
  static const courtSlotDetailsView = 'court_slot_details_view';
  static const courtsOwnedView = 'courts_owned_view';
  static const userProfileView = 'user_profile_view';
  static const playerManagerView = 'player_manager_view';
  static const notifsView = 'notifs_view';
}
