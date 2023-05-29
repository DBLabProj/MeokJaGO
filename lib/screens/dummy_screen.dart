import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class dummyScreen extends StatefulWidget {
  const dummyScreen({super.key});

  @override
  State<dummyScreen> createState() => _dummyScreenState();
}

class _dummyScreenState extends State<dummyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
