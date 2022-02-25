import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/firebase_options.dart';
import 'package:universal_platform/universal_platform.dart';

// TODO: Set to false in production
const bool useFirebaseEmulator = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: (UniversalPlatform.isAndroid)
        ? null // Use manual installation for Android (to enable Analytics)
        : DefaultFirebaseOptions.currentPlatform,
  );

  if (useFirebaseEmulator) {
    final localHostString =
        UniversalPlatform.isAndroid ? '10.0.2.2' : 'localhost';
    FirebaseFirestore.instance.settings = Settings(
      host: '$localHostString:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }

  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        final appRouter = AppRouter(isLoggedIn: user != null).router;
        return MaterialApp.router(
          title: 'Kasado',
          theme: ThemeData(
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
            primarySwatch: Colors.grey,
          ),
          routeInformationParser: appRouter.routeInformationParser,
          routerDelegate: appRouter.routerDelegate,
        );
      },
    );
  }
}
