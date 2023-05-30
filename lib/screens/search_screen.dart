import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        child: Column(
          children: [
            topBar(
              searchController: _searchController,
              title: "키워드로 고르기",
              hint: "키워드를 입력해주세요",
              showSearchBar: true,
            ),
            const SizedBox(
              height: 20,
            ),
            menuCard(
                menuImage: "assets/salmon.png",
                category: "일식",
                menu: "사케동",
                restaurant: "카모메",
                dateEaten: DateTime.utc(2023, 05, 30),
                rating: 5.0,
                ment: "사장님이 맛있고 음식이 친절해요"),
          ],
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
      margin: const EdgeInsets.all(20),
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
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColorLight,
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
                                    DateFormat("yyyy.MM.dd E")
                                        .format(dateEaten),
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
                  child: IconButton(
                    // style: ButtonStyle(pa),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
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
