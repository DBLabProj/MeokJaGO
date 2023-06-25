import 'package:flutter/material.dart';
import 'package:meokjago/main.dart';
import 'package:meokjago/screens/search_screen.dart';

import 'home_screen.dart';

class cateScreen extends StatefulWidget {
  const cateScreen({super.key});

  @override
  State<cateScreen> createState() => _cateScreenState();
}

class _cateScreenState extends State<cateScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
                minHeight: deviceSize.height -
                    MediaQuery.of(context).padding.vertical),
            child: Column(
              children: [
                topBar(
                  searchController: controller,
                  title: '일식',
                  hint: 'hint',
                  canPop: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
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
                        menuImage: "assets/food/salmon_bab.png",
                        category: '일식',
                        menu: '연어초밥',
                        restaurant: '착한초밥',
                        dateEaten: DateTime.utc(2023, 6, 10),
                        rating: 3.5,
                        ment: '그냥 무난한 연어초밥.\n여기는 광어초밥이 더 맛있는듯?',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      menuCard(
                        menuImage: "assets/food/maje.png",
                        category: '일식',
                        menu: '마제소바',
                        restaurant: '킨토토 소바',
                        dateEaten: DateTime.utc(2023, 6, 7),
                        rating: 5.0,
                        ment: '맛있다우',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      menuCard(
                        menuImage: "assets/food/donco.png",
                        category: '일식',
                        menu: '돈코츠라멘',
                        restaurant: '면식당',
                        dateEaten: DateTime.utc(2023, 6, 1),
                        rating: 4.0,
                        ment: '사장님이 맛있고\n음식이 친절한',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      menuCard(
                        menuImage: "assets/food/don.png",
                        category: '일식',
                        menu: '등심돈카츠',
                        restaurant: '오유미당',
                        dateEaten: DateTime.utc(2023, 5, 29),
                        rating: 2.0,
                        ment: '눅눅....',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      menuCard(
                        menuImage: "assets/food/abu.jpeg",
                        category: '일식',
                        menu: '아부리동',
                        restaurant: '성수호',
                        dateEaten: DateTime.utc(2023, 6, 15),
                        rating: 5.0,
                        ment: '아부리동의 정석..!\n그저 존맛...\n돈이 아깝지 않음!',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
