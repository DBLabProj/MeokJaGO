import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meokjago/l10n/l10n.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meokjago/screens/dummy_screen.dart';
import 'package:meokjago/screens/home_screen.dart';
import 'package:meokjago/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (context) => const appFrame(),
        '/login': (context) => const loginScreen(),
      },
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
      // home: const homeScreen(),
    );
  }
}

class appFrame extends StatefulWidget {
  const appFrame({super.key});

  @override
  State<appFrame> createState() => _appFrameState();
}

class _appFrameState extends State<appFrame> {
  int selected = 0;
  late Color primaryColor = Theme.of(context).primaryColor;
  late List<BottomNavigationBarItem> items;
  List<Widget> page = [
    const dummyScreen(),
    const dummyScreen(),
    const homeScreen(),
    const dummyScreen(),
    const dummyScreen()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = [
      const BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: '1'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.star_half_rounded), label: '2'),
      const BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: '3'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.people_alt_rounded), label: '4'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded), label: '5'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selected],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selected,
        items: items,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
      ),
    );
  }
}
