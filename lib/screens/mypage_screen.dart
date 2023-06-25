import 'package:flutter/material.dart';
import 'package:meokjago/screens/profile_change/change_em_screen.dart';
import 'package:meokjago/screens/profile_change/change_id_screen.dart';
import 'package:meokjago/screens/profile_change/change_ph_screen.dart';
import 'package:meokjago/screens/profile_change/change_pic_screen.dart';
import 'package:meokjago/screens/profile_change/change_pw_screen.dart';

class mypageScreen extends StatefulWidget {
  const mypageScreen({super.key});

  @override
  State<mypageScreen> createState() => _mypageScreenState();
}

String phone = '010-9999-9999';

class _mypageScreenState extends State<mypageScreen> {
  //미디어쿼리 높이 * 비율
  double mediaHeight(BuildContext context, double scale) {
    return MediaQuery.of(context).size.height * scale;
  }

  //미디어쿼리 너비 * 비율
  double mediaWidth(BuildContext context, double scale) {
    return MediaQuery.of(context).size.width * scale;
  }

  bool isPushed1 = false;
  bool isPushed2 = false;
  bool isPushed3 = false;
  bool isPushed4 = false;
  bool isPushed5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            topBar(
              searchController: TextEditingController(),
              title: "내 정보 변경",
              hint: "",
              showSearchBar: false,
            ),
            const SizedBox(
              height: 13,
            ),
            SizedBox(
              height: mediaHeight(context, 75 / 100),
              child: Column(
                children: [
                  Container(
                    height: mediaHeight(context, 4 / 100),
                  ),
                  SizedBox(
                    height: mediaHeight(context, 10 / 100),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      width: mediaHeight(context, 10 / 100),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            'assets/resizeprofile01.jpg',
                          )),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: mediaHeight(context, 7 / 100),
                    child: const Text(
                      "민구닷",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: mediaHeight(context, 4 / 100),
                    child: Container(
                      height: mediaHeight(context, 2 / 100),
                      decoration: const BoxDecoration(
                        // color: Colors.green,
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: const Text(
                        "min99@gmail.com",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: mediaHeight(context, 5 / 100),
                    child: Text(
                      phone,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    height: mediaHeight(context, 3 / 100),
                  ),
                  SizedBox(
                    height: mediaHeight(context, 0 / 100),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const changePicScreen(),
                        ),
                      );
                    },
                    onTapDown: (details) {
                      isPushed1 = true;
                      setState(() {});
                    },
                    onTapUp: (details) {
                      isPushed1 = false;
                      setState(() {});
                    },
                    onTapCancel: () {
                      isPushed1 = false;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: const Border(
                          bottom: BorderSide(width: 0.5, color: Colors.grey),
                        ),
                        color: isPushed1 ? Colors.grey.shade100 : Colors.white,
                      ),
                      height: mediaHeight(context, 6 / 100),
                      child: Row(
                        children: [
                          SizedBox(
                            width: mediaWidth(context, 15 / 100),
                          ),
                          const Text(
                            "프로필 사진 변경",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const changeIdScreen(),
                        ),
                      );
                    },
                    onTapDown: (details) {
                      isPushed2 = true;
                      setState(() {});
                    },
                    onTapUp: (details) {
                      isPushed2 = false;
                      setState(() {});
                    },
                    onTapCancel: () {
                      isPushed2 = false;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: const Border(
                          bottom: BorderSide(width: 0.5, color: Colors.grey),
                        ),
                        color: isPushed2 ? Colors.grey.shade100 : Colors.white,
                      ),
                      height: mediaHeight(context, 6 / 100),
                      child: Row(
                        children: [
                          SizedBox(
                            width: mediaWidth(context, 15 / 100),
                          ),
                          const Text(
                            "아이디 변경",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const changeEmScreen(),
                        ),
                      );
                    },
                    onTapDown: (details) {
                      isPushed3 = true;
                      setState(() {});
                    },
                    onTapUp: (details) {
                      isPushed3 = false;
                      setState(() {});
                    },
                    onTapCancel: () {
                      isPushed3 = false;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: const Border(
                          bottom: BorderSide(width: 0.5, color: Colors.grey),
                        ),
                        color: isPushed3 ? Colors.grey.shade100 : Colors.white,
                      ),
                      height: mediaHeight(context, 6 / 100),
                      child: Row(
                        children: [
                          SizedBox(
                            width: mediaWidth(context, 15 / 100),
                          ),
                          const Text(
                            "이메일 변경",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const changePhScreen(),
                        ),
                      );
                    },
                    onTapDown: (details) {
                      isPushed4 = true;
                      setState(() {});
                    },
                    onTapUp: (details) {
                      isPushed4 = false;
                      setState(() {});
                    },
                    onTapCancel: () {
                      isPushed4 = false;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: const Border(
                          bottom: BorderSide(width: 0.5, color: Colors.grey),
                        ),
                        color: isPushed4 ? Colors.grey.shade100 : Colors.white,
                      ),
                      height: mediaHeight(context, 6 / 100),
                      child: Row(
                        children: [
                          SizedBox(
                            width: mediaWidth(context, 15 / 100),
                          ),
                          const Text(
                            "휴대폰번호 변경",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const changePwScreen(),
                        ),
                      );
                    },
                    onTapDown: (details) {
                      isPushed5 = true;
                      setState(() {});
                    },
                    onTapUp: (details) {
                      isPushed5 = false;
                      setState(() {});
                    },
                    onTapCancel: () {
                      isPushed5 = false;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: const Border(
                          bottom: BorderSide(width: 0.5, color: Colors.grey),
                        ),
                        color: isPushed5 ? Colors.grey.shade100 : Colors.white,
                      ),
                      height: mediaHeight(context, 6 / 100),
                      child: Row(
                        children: [
                          SizedBox(
                            width: mediaWidth(context, 15 / 100),
                          ),
                          const Text(
                            "비밀번호 변경",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaHeight(context, 10 / 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: mediaHeight(context, 5 / 100),
                          width: mediaWidth(context, 37 / 100),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/login', (route) => false);
                            },
                            style: ButtonStyle(
                              shadowColor: MaterialStatePropertyAll(
                                  Colors.black.withOpacity(0)),
                              backgroundColor: const MaterialStatePropertyAll(
                                Color(0xFFD9D9D9),
                              ),
                            ),
                            child: const Text(
                              "로그아웃",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mediaWidth(context, 7 / 100),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class topBar extends StatelessWidget {
  String title;
  String hint;
  bool showSearchBar;

  topBar({
    super.key,
    required TextEditingController searchController,
    required this.title,
    required this.hint,
    this.showSearchBar = false,
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
                          // Perform the search here
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
