import 'package:flutter/material.dart';
import 'package:meokjago/screens/search_screen.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  String userName = "강만구";
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          topBar(
            searchController: searchController,
            title: 'title',
            hint: 'hint',
            showSearchBar: true,
          ),
          const SizedBox(
            height: 20,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              categoryItem(),
              categoryItem(),
              categoryItem(),
              categoryItem(),
            ],
          ),
          SizedBox(
            height: deviceSize.height * 0.03,
          ),
          Row(
            children: [
              Text(
                userName,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              const Text('님이 최근에 먹은 음식이예요.'),
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
