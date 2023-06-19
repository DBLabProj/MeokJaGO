import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meokjago/main.dart';
import 'package:meokjago/widgets/login_widget.dart';

class signupRecommend extends StatefulWidget {
  const signupRecommend({super.key});

  @override
  State<signupRecommend> createState() => _signupRecommendState();
}

class _signupRecommendState extends State<signupRecommend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Stack(
        children: [
          const loginBackground(),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.height * 0.21,
                MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.height * 0.05),
            child: Column(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: deviceSize.height * 0.05,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  '선호 메뉴를 선택해주세요.',
                                  style: TextStyle(
                                      fontSize: 24, color: Color(0xff7c7c7c)),
                                ),
                              ],
                            )),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  height: 550,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          recommendCard(
                                            imageURL: 'assets/food/china.png',
                                            foodName: '짜장면',
                                          ),
                                          recommendCard(
                                            imageURL: 'assets/food/chicken.png',
                                            foodName: '치킨',
                                          ),
                                          recommendCard(
                                            imageURL: 'assets/food/korean.png',
                                            foodName: '비빔밥',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          recommendCard(
                                            imageURL: 'assets/food/ramen.png',
                                            foodName: '라멘',
                                          ),
                                          recommendCard(
                                            imageURL: 'assets/food/tomato.png',
                                            foodName: '토마토파스타',
                                          ),
                                          recommendCard(
                                            imageURL: 'assets/food/japen.png',
                                            foodName: '라면',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          recommendCard(
                                            imageURL: 'assets/food/curry.png',
                                            foodName: '카레',
                                          ),
                                          recommendCard(
                                            imageURL: 'assets/food/omelet.png',
                                            foodName: '오므라이스',
                                          ),
                                          recommendCard(
                                            imageURL:
                                                'assets/food/ratatouille.png',
                                            foodName: '라따뚜이',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          recommendCard(
                                            imageURL: 'assets/food/udong.png',
                                            foodName: '튀김 우동',
                                          ),
                                          recommendCard(
                                            imageURL: 'assets/food/seafood.png',
                                            foodName: '해물 짬뽕',
                                          ),
                                          recommendCard(
                                            imageURL: 'assets/food/taco.png',
                                            foodName: '타코',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          recommendCard(
                                            imageURL:
                                                'assets/food/takoyaki.png',
                                            foodName: '타코야끼',
                                          ),
                                          recommendCard(
                                            imageURL:
                                                'assets/food/carbonara.png',
                                            foodName: '까르보나라',
                                          ),
                                          recommendCard(
                                            imageURL: 'assets/food/kim.png',
                                            foodName: '김밥',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: SizedBox(
                            height: deviceSize.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    side: MaterialStatePropertyAll(BorderSide(
                                        color: Theme.of(context).primaryColor)),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Colors.white),
                                  ),
                                  child: Text(
                                    '새로고침',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                        msg: '성공적으로 등록되었습니다.');
                                    Navigator.popAndPushNamed(
                                        context, '/login');
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Theme.of(context).primaryColor)),
                                  child: const Text(
                                    "회원가입",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class recommendCard extends StatefulWidget {
  String imageURL = '';
  String foodName = '';
  recommendCard({
    super.key,
    required this.foodName,
    required this.imageURL,
  });

  @override
  State<recommendCard> createState() => _recommendCardState();
}

class _recommendCardState extends State<recommendCard> {
  List<bool> selected = [false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      selectedBorderColor: Theme.of(context).primaryColor,
      onPressed: (index) {
        setState(() {
          selected[0] = !selected[0];
        });
      },
      isSelected: selected,
      children: [
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                widget.imageURL,
                width: 50,
                height: 50,
              ),
              Text(
                widget.foodName,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
        )
      ],
    );
  }
}
