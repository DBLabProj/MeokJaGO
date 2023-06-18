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
                  menu: '사케동',
                  restaurant: '카모메',
                  dateEaten: DateTime.now(),
                  rating: 4.5,
                  ment: '연어가 조금 신선하지 않은 느낌\n다른 곳에서 먹었던 사케동은 맛있었는데...',
                ),
                const SizedBox(
                  height: 20,
                ),
                menuCard(
                  menuImage: "assets/salmon.png",
                  category: '피자',
                  menu: '포테이토피자',
                  restaurant: '반올림',
                  dateEaten: DateTime.utc(2023, 6, 17),
                  rating: 5,
                  ment: '역시 포테이토, 넘모 맛있어\n다음에도 포테이토 시켜먹어야지~😙',
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
