import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meokjago/l10n/l10n.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:meokjago/screens/login_screen.dart';
import 'package:meokjago/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        //AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        primaryColor: const Color(0xFFEF8931),
        primaryColorLight: const Color(0XFFB3B3B3),
      ),
      home: const searchScreen(),
    );
  }
}
