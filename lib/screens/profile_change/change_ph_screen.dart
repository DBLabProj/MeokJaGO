import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meokjago/main.dart';
import 'package:meokjago/screens/mypage_screen.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';

class changePhScreen extends StatefulWidget {
  const changePhScreen({super.key});

  @override
  State<changePhScreen> createState() => _changePhScreenState();
}

class _changePhScreenState extends State<changePhScreen> {
  double mediaHeight(BuildContext context, double scale) {
    return MediaQuery.of(context).size.height * scale;
  }

  //미디어쿼리 너비 * 비율
  double mediaWidth(BuildContext context, double scale) {
    return MediaQuery.of(context).size.width * scale;
  }

  TextEditingController controller = TextEditingController();

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
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SizedBox(
            height: deviceSize.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
            child: Column(
              children: [
                topBar(
                  searchController: TextEditingController(),
                  title: "휴대폰번호 변경",
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
                      // Container(
                      //   alignment: Alignment.center,
                      //   height: mediaHeight(context, 5 / 100),
                      //   child: Text(
                      //     phone,
                      //     style: const TextStyle(
                      //       fontSize: 20,
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),
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
                        height: mediaHeight(context, 1 / 100),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: mediaHeight(context, 6 / 100),
                        child: Row(
                          children: [
                            SizedBox(
                              width: mediaWidth(context, 10 / 100),
                            ),
                            const Text(
                              "기존 휴대폰번호",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: mediaHeight(context, 6 / 100),
                        child: Row(
                          children: [
                            SizedBox(
                              width: mediaWidth(context, 10 / 100),
                            ),
                            Text(
                              phone,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        height: mediaHeight(context, 6 / 100),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        height: mediaHeight(context, 8 / 100),
                        child: Row(
                          children: [
                            SizedBox(
                              width: mediaWidth(context, 10 / 100),
                            ),
                            const Text(
                              "변경 휴대폰번호",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mediaHeight(context, 2 / 100),
                      ),
                      Container(
                        height: mediaHeight(context, 5 / 100),
                        margin: EdgeInsets.only(
                          left: mediaWidth(context, 10 / 100),
                          right: mediaWidth(context, 10 / 100),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              spreadRadius: -1.0,
                              blurRadius: 1.0,
                              offset: Offset(-1, -1),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: controller,
                          inputFormatters: [
                            MultiMaskedTextInputFormatter(
                                masks: ['xxx-xxxx-xxxx', 'xxx-xxx-xxxx'],
                                separator: '-'),
                          ],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        height: mediaHeight(context, 10 / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: mediaHeight(context, 5 / 100),
                              width: mediaWidth(context, 37 / 100),
                              child: ElevatedButton(
                                onPressed: () {
                                  phone = controller.text;
                                  Fluttertoast.showToast(msg: '성공적으로 변경되었습니다.');
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  shadowColor: MaterialStatePropertyAll(
                                      Colors.black.withOpacity(0)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                    Color(0xFFEF8931),
                                  ),
                                ),
                                child: const Text(
                                  "변경 하기",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: mediaWidth(context, 10 / 100),
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
                          builder: (context) => const changePhScreen(),
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
