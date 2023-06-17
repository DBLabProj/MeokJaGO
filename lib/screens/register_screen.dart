import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:meokjago/screens/search_screen.dart';

class foodRegisterScreen extends StatefulWidget {
  const foodRegisterScreen({super.key});

  @override
  State<foodRegisterScreen> createState() => _foodRegisterScreenState();
}

enum Where { Home, Other }

class _foodRegisterScreenState extends State<foodRegisterScreen> {
  bool isSelected = true;
  double starRate = 0.0;
  String foodName = '부타동';
  Where _where = Where.Home;
  TextStyle defaultStyle = const TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(children: [
        Positioned(child: Image.asset('assets/ramen.jpeg')),
        Column(
          children: [
            topBar(
                searchController: TextEditingController(),
                title: '등록하기',
                hint: ''),
            Expanded(
              child: SizedBox(
                child: Container(color: Colors.transparent),
              ),
            ),
            Container(
              height: deviceSize.height * 0.50,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              width: deviceSize.width,
              decoration: const BoxDecoration(
                  boxShadow: [],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('무얼 먹었나요?', style: defaultStyle),
                  Text(
                    foodName,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '어디서 먹었나요?',
                    style: defaultStyle,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          minLeadingWidth: 0.0,
                          onTap: () {
                            setState(() {
                              _where = Where.Home;
                            });
                          },
                          leading: SizedBox(
                            width: 24,
                            child: Radio(
                              activeColor: Colors.amber,
                              value: Where.Home,
                              groupValue: _where,
                              onChanged: (value) {
                                // setState(() {
                                //   _where = value!;
                                // }
                                // );
                              },
                            ),
                          ),
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: 0),
                          contentPadding: EdgeInsets.zero,
                          title: const Text('집'),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: RadioListTile(
                          activeColor: Theme.of(context).primaryColor,
                          contentPadding: EdgeInsets.zero,
                          value: Where.Other,
                          groupValue: _where,
                          onChanged: (value) {
                            setState(() {
                              _where = value!;
                            });
                          },
                          title: TextField(
                            onChanged: (value) {
                              setState(() {
                                _where = Where.Other;
                              });
                            },
                            decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '어땠나요?',
                    style: defaultStyle,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        allowHalfRating: true,
                        glow: false,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (value) {
                          setState(() {
                            starRate = value;
                          });
                        },
                      ),
                      Text(
                        (starRate).toString(),
                        style: defaultStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                      height: deviceSize.height * 0.2,
                      child: const TextField(
                        textAlignVertical: TextAlignVertical.top,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        // minLines: 0,
                        maxLines: null,
                        expands: true,
                      )),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
