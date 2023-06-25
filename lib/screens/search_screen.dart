import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meokjago/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

final ValueNotifier<int> rec_num = ValueNotifier<int>(0);

class _searchScreenState extends State<searchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final Map recommendMap = {
    'menuImage': [
      'assets/recommendfood/fish01.jpg',
      'assets/recommendfood/fish02.jpg',
      'assets/recommendfood/fish03.jpg',
      'assets/recommendfood/fish04.jpg',
      'assets/recommendfood/pasta01.jpg',
      'assets/recommendfood/pasta02.jpg',
      'assets/recommendfood/pasta03.jpg',
      'assets/recommendfood/pasta04.jpg',
      'assets/recommendfood/ramen01.jpg',
      'assets/recommendfood/ramen02.jpg',
      'assets/recommendfood/ramen03.jpg',
      'assets/recommendfood/ramen04.jpeg',
    ],
    'category': [
      '일식',
      '일식',
      '일식',
      '일식',
      '양식',
      '양식',
      '양식',
      '양식',
      '일식',
      '일식',
      '일식',
      '일식',
    ],
    'menu': [
      '연어회',
      '연어초밥',
      '간장연어덮밥',
      '아부리동',
      '알리오올리오',
      '봉골레파스타',
      '로제파스타',
      '크림파스타',
      '소유라멘',
      '돈코츠라멘',
      '우동',
      '고등어소바',
    ],
    'restaurant': [
      '연어야',
      '하루초밥',
      '우마이',
      '히토리',
      '킴브로',
      '시옷파스타',
      '킴브로',
      '도로시',
      '면식당',
      '후카미',
      '우도우동',
      '히토리',
    ],
    'dateEaten': [
      DateTime.utc(2023, 03, 17),
      DateTime.utc(2023, 05, 06),
      DateTime.utc(2023, 01, 21),
      DateTime.utc(2023, 03, 03),
      DateTime.utc(2023, 05, 25),
      DateTime.utc(2023, 05, 05),
      DateTime.utc(2023, 04, 08),
      DateTime.utc(2023, 06, 11),
      DateTime.utc(2023, 04, 11),
      DateTime.utc(2023, 04, 27),
      DateTime.utc(2023, 02, 17),
      DateTime.utc(2023, 04, 04),
    ],
    'rating': [
      4.5,
      4.0,
      2.5,
      3.5,
      4.0,
      4.5,
      1.5,
      3.0,
      4.5,
      4.5,
      2.5,
      1.0,
    ],
    'ment': [
      '기름진 부위도 많고, 맛있엉!!',
      '가격도 맛도 좋았다.',
      '연어에서 좀 냄새가...',
      '맛은 괜찮은데 조금 비싸다!',
      '매콤한 알리오올리오!',
      '조개랑 해물이 아낌없이 들어갔어.',
      '내가 만들어도 이것보다 맛나겠다.',
      '소스는 맛있는데 면이 다 불어서 왔네..',
      '간장 국물 맛이 깔끔! 또 시켜 먹어야겠다.',
      '내 인생 라멘인듯',
      '그냥 휴게소 우동맛',
      '고등어 비린내...',
    ],
  };

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
                child: ValueListenableBuilder(
                  valueListenable: rec_num,
                  builder: (context, value, child) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {});
                    });
                    value = rec_num.value;
                    return child!;
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      chooseCard(
                        menuImage: recommendMap['menuImage'][rec_num.value],
                        category: recommendMap['category'][rec_num.value],
                        menu: recommendMap['menu'][rec_num.value],
                        restaurant: recommendMap['restaurant'][rec_num.value],
                        dateEaten: recommendMap['dateEaten'][rec_num.value],
                        rating: recommendMap['rating'][rec_num.value],
                        ment: recommendMap['ment'][rec_num.value],
                      ),
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
                        menuImage: recommendMap['menuImage'][rec_num.value + 1],
                        category: recommendMap['category'][rec_num.value + 1],
                        menu: recommendMap['menu'][rec_num.value + 1],
                        restaurant: recommendMap['restaurant']
                            [rec_num.value + 1],
                        dateEaten: recommendMap['dateEaten'][rec_num.value + 1],
                        rating: recommendMap['rating'][rec_num.value + 1],
                        ment: recommendMap['ment'][rec_num.value + 1],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      menuCard(
                        menuImage: recommendMap['menuImage'][rec_num.value + 2],
                        category: recommendMap['category'][rec_num.value + 2],
                        menu: recommendMap['menu'][rec_num.value + 2],
                        restaurant: recommendMap['restaurant']
                            [rec_num.value + 2],
                        dateEaten: recommendMap['dateEaten'][rec_num.value + 2],
                        rating: recommendMap['rating'][rec_num.value + 2],
                        ment: recommendMap['ment'][rec_num.value + 2],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      menuCard(
                        menuImage: recommendMap['menuImage'][rec_num.value + 3],
                        category: recommendMap['category'][rec_num.value + 3],
                        menu: recommendMap['menu'][rec_num.value + 3],
                        restaurant: recommendMap['restaurant']
                            [rec_num.value + 3],
                        dateEaten: recommendMap['dateEaten'][rec_num.value + 3],
                        rating: recommendMap['rating'][rec_num.value + 3],
                        ment: recommendMap['ment'][rec_num.value + 3],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
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
                                onPressed: () {
                                  likedToast();
                                },
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
                                onPressed: () {
                                  dislikedToast();
                                  if (rec_num.value == 0) {
                                    rec_num.value = 4;
                                  } else if (rec_num.value == 4) {
                                    rec_num.value = 8;
                                  } else {
                                    rec_num.value = 0;
                                  }
                                },
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

void likedToast() {
  Fluttertoast.showToast(
    msg: "선호 메뉴를 확인했어요.",
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_SHORT,
    textColor: Colors.black,
    backgroundColor: Colors.white,
  );
}

void dislikedToast() {
  Fluttertoast.showToast(
    msg: "다시 추천드려요.",
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_SHORT,
    textColor: Colors.black,
    backgroundColor: Colors.white,
  );
}
