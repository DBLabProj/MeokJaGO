import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meokjago/main.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBar(
                searchController: _searchController,
                title: "민구닷 님을 위한 추천",
                hint: "키워드를 입력해주세요",
                showSearchBar: false,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    chooseCard(
                        menuImage: 'assets/food/maje.png',
                        category: '일식',
                        menu: '마제소바',
                        restaurant: '킨토토',
                        dateEaten: DateTime.utc(2023, 06, 07),
                        rating: 5.0,
                        ment: '맛있다우'),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      '비슷한 음식',
                      textScaleFactor: 1.5,
                    ),
                    const Divider(
                      thickness: 3,
                      color: Color(0xff7c7c7c),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    menuCard(
                      menuImage: "assets/food/abu.jpeg",
                      category: '일식',
                      menu: '아부리동',
                      restaurant: '성수호',
                      dateEaten: DateTime.utc(2023, 6, 17),
                      rating: 5.0,
                      ment: '아부리동의 정석..!\n그저 존맛...\n돈이 아깝지 않음!',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    menuCard(
                        menuImage: "assets/food/kyu.png",
                        category: "일식",
                        menu: "규동",
                        restaurant: "후쿠야키",
                        dateEaten: DateTime.utc(2023, 05, 30),
                        rating: 2.5,
                        ment: "물려...느끼해..."),
                    const SizedBox(
                      height: 20,
                    ),
                    menuCard(
                        menuImage: "assets/food/kai.png",
                        category: "일식",
                        menu: "카이센동",
                        restaurant: "성수호",
                        dateEaten: DateTime.utc(2023, 05, 30),
                        rating: 4.5,
                        ment: "진짜 큰맘 먹고 시켜먹었다\n안 비싸기만 하면 매일 먹는다.. 진짜"),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class menuCard extends StatelessWidget {
  String menuImage;
  String category;
  String menu;
  String restaurant;
  DateTime dateEaten;
  double rating;
  String ment;

  menuCard({
    super.key,
    required this.menuImage,
    required this.category,
    required this.menu,
    required this.restaurant,
    required this.dateEaten,
    required this.rating,
    required this.ment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(1, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      menuImage,
                      height: 120,
                      width: 118,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 15,
                                ),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 3,
                                  ),
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                menu,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                ),
                              ),
                              Text(
                                restaurant,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF7c7c7c),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    DateFormat("yyyy.MM.dd E", "ko")
                                        .format(dateEaten),
                                    style: const TextStyle(
                                        color: Color(0xFF7c7c7c), fontSize: 13),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "★",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        Text(
                                          rating.toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  child: Text(
                                    ment,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
            ),
            height: 5,
          ),
        ],
      ),
    );
  }
}

class topBar extends StatelessWidget {
  String title;
  String hint;
  bool showSearchBar;
  bool canPop;
  String pageRoute;
  topBar({
    super.key,
    required TextEditingController searchController,
    required this.title,
    required this.hint,
    this.showSearchBar = false,
    this.pageRoute = '/',
    this.canPop = false,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                canPop
                    ? SizedBox(
                        width: 35,
                        height: 35,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      )
                    : const Text(''),
                Flexible(
                  flex: 1,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            showSearchBar
                ? const SizedBox(
                    height: 20,
                  )
                : const SizedBox(),
            showSearchBar
                ? TextField(
                    controller: _searchController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: hint,
                      hintStyle: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 20,
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(5.0),
                      // Add a clear button to the search bar
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        onPressed: () => _searchController.clear(),
                      ),
                      // Add a search icon or button to the search bar
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, pageRoute);
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class chooseCard extends StatelessWidget {
  String menuImage;
  String category;
  String menu;
  String restaurant;
  DateTime dateEaten;
  double rating;
  String ment;

  chooseCard({
    super.key,
    required this.menuImage,
    required this.category,
    required this.menu,
    required this.restaurant,
    required this.dateEaten,
    required this.rating,
    required this.ment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(1, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      menuImage,
                      height: 120,
                      width: 118,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 15,
                                ),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 3,
                                  ),
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                menu,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                ),
                              ),
                              Text(
                                restaurant,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF7c7c7c),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    DateFormat("yyyy.MM.dd E", "ko")
                                        .format(dateEaten),
                                    style: const TextStyle(
                                        color: Color(0xFF7c7c7c), fontSize: 13),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "★",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        Text(
                                          rating.toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  width: double.infinity,
                                  child: Text(
                                    ment,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: SizedBox(
                      width: deviceSize.width * 0.55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 95,
                            child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Theme.of(context).primaryColor)),
                                child: const Text(
                                  '좋아요',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          SizedBox(
                            width: 95,
                            child: TextButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xff7c7c7c))),
                                child: const Text(
                                  '별로예요',
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
            ),
            height: 5,
          ),
        ],
      ),
    );
  }
}
