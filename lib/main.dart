import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meokjago/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meokjago/screens/friend_screen.dart';
import 'package:meokjago/screens/home_screen.dart';
import 'package:meokjago/screens/login_screen.dart';
import 'package:meokjago/screens/mypage_screen.dart';
import 'package:meokjago/screens/recommend_screen.dart';
import 'package:meokjago/screens/register_screen.dart';
import 'package:meokjago/screens/search_screen.dart';
import 'package:meokjago/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

late Size deviceSize;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (context) => const appFrame(),
        '/login': (context) => const loginScreen(),
        '/signup/recommend': (context) => const signupRecommend(),
        '/signup': (context) => const signupScreen(),
        '/register': (context) => const foodRegisterScreen(),
      },
      title: 'Flutter Demo',
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Color(0xFFEF8931),
          toolbarHeight: 0,
          elevation: 0,
        ),
        checkboxTheme: const CheckboxThemeData(
          visualDensity: VisualDensity.compact,
          fillColor: MaterialStatePropertyAll(Color(0xFFEF8931)),
          side: BorderSide(color: Colors.grey),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        primaryColor: const Color(0xFFEF8931),
        primaryColorLight: const Color(0XFFB3B3B3),
      ),
    );
  }
}

class appFrame extends StatefulWidget {
  const appFrame({super.key});

  @override
  State<appFrame> createState() => _appFrameState();
}

class _appFrameState extends State<appFrame> {
  int selected = 2;
  late Color primaryColor = Theme.of(context).primaryColor;
  late List<BottomNavigationBarItem> items;
  List<Widget> page = [
    const foodRegisterScreen(),
    const searchScreen(),
    homeScreen(),
    const friendScreen(),
    const mypageScreen(),
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
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: page[selected],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selected,
        items: items,
        backgroundColor: Colors.white,
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
