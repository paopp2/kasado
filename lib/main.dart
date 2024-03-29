import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/firebase_options.dart';
import 'package:kasado/kasado_app.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

// TODO: Set to false in production
const bool inDebugMode = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: (UniversalPlatform.isAndroid)
        ? null // Use manual installation for Android (to enable Analytics)
        : DefaultFirebaseOptions.currentPlatform,
  );

  if (inDebugMode) {
    final localHostString =
        UniversalPlatform.isAndroid ? '10.0.2.2' : 'localhost';
    FirebaseFirestore.instance.settings = Settings(
      host: '$localHostString:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }

  usePathUrlStrategy();

  final mixpanelInstance = await Mixpanel.init(
    "2d8fa8dd56a27950bb14036586c618e6",
    optOutTrackingDefault: inDebugMode,
    trackAutomaticEvents: true,
  );

  runApp(ProviderScope(
    child: const KasadoApp(),
    overrides: [mixpanel.overrideWithValue(mixpanelInstance)],
  ));
}
