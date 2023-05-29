import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),
            ],
          ),
        ],
      ),
    ));
  }
}

class categoryItem extends StatelessWidget {
  const categoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.21,
      height: MediaQuery.of(context).size.width * 0.21,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.food_bank_rounded,
              size: 50,
            ),
            Text('한식'),
          ],
        ),
      ),
    );
  }
}
