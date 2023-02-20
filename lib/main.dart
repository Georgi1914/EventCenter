import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/get_it.dart';
import 'app/route_manager.dart';
import 'presentation/theme_manager.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        initialRoute: RouteManager.homePage,
        onGenerateRoute: RouteManager.generateRoute,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        theme: getApplicationTheme(),
      );
}
