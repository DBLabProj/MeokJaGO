import 'package:flutter/material.dart';

class changePicScreen extends StatefulWidget {
  const changePicScreen({super.key});

  @override
  State<changePicScreen> createState() => _changePicScreenState();
}

class _changePicScreenState extends State<changePicScreen> {
  double mediaHeight(BuildContext context, double scale) {
    return MediaQuery.of(context).size.height * scale;
  }

  //미디어쿼리 너비 * 비율
  double mediaWidth(BuildContext context, double scale) {
    return MediaQuery.of(context).size.width * scale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            topBar(
              searchController: TextEditingController(),
              title: "프로필 사진 변경",
              hint: "",
              showSearchBar: false,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: mediaHeight(context, 77 / 100),
              child: Column(
                children: [
                  Container(
                    height: mediaHeight(context, 4 / 100),
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: mediaWidth(context, 1 / 2) -
                              mediaHeight(context, 5 / 100),
                        ),
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
                        margin: EdgeInsets.only(
                          top: mediaHeight(context, 10 / 100),
                        ),
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
                        height: mediaHeight(context, 4 / 100),
                        width: mediaHeight(context, 4 / 100),
                        margin: EdgeInsets.only(
                          left: mediaWidth(context, 1 / 2) +
                              mediaHeight(context, 3 / 100),
                          top: mediaHeight(context, 10 / 100) -
                              mediaHeight(context, 2 / 100),
                        ),
                        child: Image.asset('assets/changeProfile.png'),
                      ),
                    ],
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
                    child: const Text(
                      "010-9999-9999",
                      style: TextStyle(
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
        padding:
            const EdgeInsets.only(left: 10, right: 20, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 35,
                  width: 35,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const changePicScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
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
