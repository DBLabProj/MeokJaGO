import 'package:flutter/material.dart';
import 'package:meokjago/main.dart';
import 'package:meokjago/screens/search_screen.dart';

class friendScreen extends StatefulWidget {
  const friendScreen({super.key});

  @override
  State<friendScreen> createState() => _friendScreenState();
}

class _friendScreenState extends State<friendScreen> {
  bool hasFriend = true;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        topBar(
          searchController: controller,
          showSearchBar: true,
          title: '친구와 함께 고르기',
          hint: '아이디로 친구 추가',
          pageRoute: '/friend/search',
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: hasFriend
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                hasFriend
                    ? Column(
                        children: [
                          friendCard(
                            profileImage: "assets/yeopjong.png",
                            profileName: "플랫폼",
                            reviewCount: 117,
                            ratingAverage: 4.8,
                            isFriend: true,
                            isRequested: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          friendCard(
                            profileImage: "assets/myzu.png",
                            profileName: "myzu",
                            reviewCount: 71,
                            ratingAverage: 4.3,
                            isFriend: true,
                            isRequested: true,
                          ),
                        ],
                      )
                    : Column(
                        children: const [
                          Text(
                            '텅',
                            style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.bold),
                            textScaleFactor: 5,
                          ),
                          Text(
                            '아직 친구가 없어요...',
                            textScaleFactor: 1.3,
                          )
                        ],
                      )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class friendCard extends StatefulWidget {
  String profileImage;
  String profileName;
  int reviewCount;
  double ratingAverage;
  bool isFriend;
  bool isRequested;

  friendCard({
    super.key,
    required this.profileImage,
    required this.profileName,
    required this.reviewCount,
    required this.ratingAverage,
    required this.isFriend,
    required this.isRequested,
  });

  @override
  State<friendCard> createState() => _friendCardState();
}

class _friendCardState extends State<friendCard> {
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
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.profileImage,
                      width: 90,
                      height: 90,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.profileName,
                                    style: const TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  widget.isRequested
                                      ? Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Text(
                                            '요청 대기',
                                            textScaleFactor: 0.8,
                                            style: TextStyle(),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '작성 리뷰: ${widget.reviewCount}',
                                      style: const TextStyle(
                                        color: Color(0xff7c7c7c),
                                        fontFamily: 'NotoSansKR',
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      '평균 별점: ${widget.ratingAverage}',
                                      style: const TextStyle(
                                        color: Color(0xff7c7c7c),
                                        fontFamily: 'NotoSansKR',
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isFriend = !widget.isFriend;
                        });
                      },
                      icon: Icon(
                        Icons.person_add_alt_outlined,
                        color: widget.isFriend
                            ? const Color(0xff7c7c7c)
                            : Theme.of(context).primaryColor,
                        size: 40,
                      ))
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

class friendSearchScreen extends StatefulWidget {
  const friendSearchScreen({super.key});

  @override
  State<friendSearchScreen> createState() => _friendSearchScreenState();
}

class _friendSearchScreenState extends State<friendSearchScreen> {
  bool hasFriend = true;
  int selected = 3;
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: '1'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.star_half_rounded), label: '2'),
    const BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: '3'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.people_alt_rounded), label: '4'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded), label: '5'),
  ];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller.text = '햄';
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selected,
        items: items,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: deviceSize.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBar(
                  searchController: controller,
                  showSearchBar: true,
                  title: '친구와 함께 고르기',
                  hint: '아이디로 친구 추가'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: hasFriend
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      hasFriend
                          ? Column(
                              children: [
                                friendCard(
                                  profileImage: "assets/ham.jpeg",
                                  profileName: "광햄",
                                  reviewCount: 117,
                                  ratingAverage: 4.4,
                                  isFriend: true,
                                  isRequested: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                friendCard(
                                  profileImage: "assets/die.jpeg",
                                  profileName: "헴버거",
                                  reviewCount: 71,
                                  ratingAverage: 4.3,
                                  isFriend: true,
                                  isRequested: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '내 친구',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  height: 3,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                friendCard(
                                  profileImage: "assets/yeopjong.png",
                                  profileName: "플랫폼",
                                  reviewCount: 117,
                                  ratingAverage: 4.8,
                                  isFriend: true,
                                  isRequested: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                friendCard(
                                  profileImage: "assets/myzu.png",
                                  profileName: "myzu",
                                  reviewCount: 71,
                                  ratingAverage: 4.3,
                                  isFriend: true,
                                  isRequested: true,
                                ),
                              ],
                            )
                          : Column(
                              children: const [
                                Text(
                                  '텅',
                                  style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.bold),
                                  textScaleFactor: 5,
                                ),
                                Text(
                                  '아직 친구가 없어요...',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
