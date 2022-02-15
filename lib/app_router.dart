import 'package:go_router/go_router.dart';
import 'package:kasado/ui/auth/login_view.dart';
import 'package:kasado/ui/home/home_view.dart';

class AppRouter {
  AppRouter(this.isLoggedIn);
  final bool isLoggedIn;
  late final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: Routes.homeView,
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        name: Routes.loginView,
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
    ],
    redirect: (state) {
      final loggingIn = state.subloc == '/login';

      // If the user is not logged in, they must login
      if (!isLoggedIn) return loggingIn ? null : '/login';

      // if the user is logged in but still on LoginView, send them to
      // the HomeView
      if (loggingIn) return '/';

      // no need to redirect at all
      return null;
    },
  );
}

class Routes {
  static const homeView = 'home_view';
  static const loginView = 'login_view';
}
