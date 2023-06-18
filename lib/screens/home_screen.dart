import 'package:flutter/material.dart';
import 'package:meokjago/main.dart';
import 'package:meokjago/screens/search_screen.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  String userName = "강만구";
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          topBar(
            searchController: searchController,
            title: '키워드로 고르기',
            hint: '키워드를 입력해주세요.',
            showSearchBar: true,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: deviceSize.width - 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          categoryItem(),
                          categoryItem(),
                          categoryItem(),
                          categoryItem(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          categoryItem(),
                          categoryItem(),
                          categoryItem(),
                          categoryItem(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          categoryItem(),
                          categoryItem(),
                          categoryItem(),
                          categoryItem(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '님이 최근에 먹은 음식이예요.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                menuCard(
                  menuImage: "assets/salmon.png",
                  category: '일식',
                  menu: 'menu',
                  restaurant: '집',
                  dateEaten: DateTime.now(),
                  rating: 4.5,
                  ment: 'ment',
                ),
                const SizedBox(
                  height: 20,
                ),
                menuCard(
                  menuImage: "assets/salmon.png",
                  category: '일식',
                  menu: '라멘',
                  restaurant: '면식당',
                  dateEaten: DateTime.now(),
                  rating: 5,
                  ment: '맛있땅',
                ),
              ],
            ),
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
      width: MediaQuery.of(context).size.height * 0.095,
      height: MediaQuery.of(context).size.height * 0.095,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.image,
              size: 50,
            ),
            Text('한식'),
          ],
        ),
      ),
    );
  }
}
