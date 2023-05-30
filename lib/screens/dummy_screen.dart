import 'package:flutter/material.dart';

class dummyScreen extends StatefulWidget {
  const dummyScreen({super.key});

  @override
  State<dummyScreen> createState() => _dummyScreenState();
}

enum Where { Home, Other }

class _dummyScreenState extends State<dummyScreen> {
  final Where _where = Where.Home;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
