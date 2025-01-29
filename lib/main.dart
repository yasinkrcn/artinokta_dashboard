import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tv_artinokta/core/const/app_constants.dart';
import 'package:tv_artinokta/core/init/providers.dart';
import 'package:tv_artinokta/core/init/startup_manager.dart';
import 'package:tv_artinokta/feature/dashboard/view/page/dashboard_page.dart';

void main() async {

  await StartupManager.initialize();

  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: Consumer(
        builder: (context, value, child) => const MyApp(),
      ),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: kDebugMode,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFF5F7FA),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('tr', 'TR'),
        ],
        home: DashboardScreen());
  }
}
