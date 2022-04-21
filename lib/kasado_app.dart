import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kasado/app_router.dart';

class KasadoApp extends StatelessWidget {
  const KasadoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter.instance.router;

    return MaterialApp.router(
      title: 'Kasado',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.grey,
      ),
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
    );
  }
}
