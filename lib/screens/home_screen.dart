import 'package:flutter/material.dart';
import 'package:meokjago/main.dart';
import 'package:meokjago/screens/japan_screen.dart';
import 'package:meokjago/screens/search_screen.dart';

double realHeight = 0;
bool addFish = false;
bool addJjam = false;

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  String userName = "민구닷";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(deviceSize.height);
    realHeight = deviceSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        80;
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
            // height: deviceSize.height -
            //     MediaQuery.of(context).padding.top -
            //     MediaQuery.of(context).padding.bottom,
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
                        children: [
                          categoryItem(foodNum: 0),
                          categoryItem(foodNum: 1),
                          categoryItem(foodNum: 2),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const cateScreen(),
                                    ));
                              },
                              child: categoryItem(foodNum: 3)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          categoryItem(foodNum: 4),
                          categoryItem(foodNum: 5),
                          categoryItem(foodNum: 6),
                          categoryItem(foodNum: 7),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          categoryItem(foodNum: 8),
                          categoryItem(foodNum: 9),
                          categoryItem(foodNum: 10),
                          categoryItem(foodNum: 11),
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
                addFish
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          menuCard(
                            menuImage: "assets/food/fish.jpg",
                            category: '일식',
                            menu: '광어회',
                            restaurant: '삼학도',
                            dateEaten: DateTime.now(),
                            rating: 5.0,
                            ment: '역시 광어 크흐.....',
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      )
                    : Container(),
                addJjam
                    ? Column(
                        children: [
                          menuCard(
                            menuImage: "assets/food/jjam.jpg",
                            category: '중식',
                            menu: '짬뽕',
                            restaurant: '짬뽕의맛',
                            dateEaten: DateTime.now(),
                            rating: 4.5,
                            ment: '여기 맛집이네!!',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : Container(),
                menuCard(
                  menuImage: "assets/salmon.png",
                  category: '일식',
                  menu: '사케동',
                  restaurant: '카모메',
                  dateEaten: DateTime.utc(2023, 6, 24),
                  rating: 2.5,
                  ment: '연어가 조금 신선하지 않은 느낌\n다른 곳에서 먹었던 사케동은 맛있었는데...',
                ),
                const SizedBox(
                  height: 20,
                ),
                menuCard(
                  menuImage: "assets/food/potatopizza.jpeg",
                  category: '피자',
                  menu: '포테이토피자',
                  restaurant: '반올림',
                  dateEaten: DateTime.utc(2023, 6, 23),
                  rating: 4.5,
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
  categoryItem({
    super.key,
    required this.foodNum,
  });

  int foodNum;

  List foodName = [
    "한식",
    "중식",
    "양식",
    "일식",
    "치킨",
    "피자",
    "분식",
    "패스트푸드",
    "찜·탕",
    "고기",
    "야식",
    "디저트",
  ];

  List foodImage = [
    "assets/food/korean.png",
    "assets/food/china.png",
    "assets/food/west.png",
    "assets/food/japen.png",
    "assets/food/chicken.png",
    "assets/food/pizza.png",
    "assets/food/snack.png",
    "assets/food/fast.png",
    "assets/food/tang.png",
    "assets/food/meat.png",
    "assets/food/night.png",
    "assets/food/dessert.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.095,
      height: MediaQuery.of(context).size.height * 0.095,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 3,
            ),
            SizedBox(
              height: 40,
              width: (foodNum == 10) ? 55 : 40,
              child: Image.asset(foodImage[foodNum]),
            ),
            Text(
              foodName[foodNum],
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
