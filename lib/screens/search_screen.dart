import 'package:flutter/material.dart';

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
            Container(
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
                    const Text(
                      '키워드로 고르기',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _searchController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: '키워드를 입력해주세요',
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
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              child: const Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}
