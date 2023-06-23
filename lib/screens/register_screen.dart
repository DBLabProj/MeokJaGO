import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meokjago/apis/detect.dart';
import 'package:meokjago/main.dart';
import 'package:meokjago/screens/home_screen.dart';
import 'package:meokjago/screens/search_screen.dart';

class foodRegisterScreen extends StatefulWidget {
  Function change;
  foodRegisterScreen({super.key, required this.change});

  @override
  State<foodRegisterScreen> createState() => _foodRegisterScreenState();
}

enum Where { Home, Other }

class _foodRegisterScreenState extends State<foodRegisterScreen> {
  Map<String, dynamic> predResult = {};
  double imageHeight = 100;
  bool isRes = false;
  List<dynamic> results = [];
  final String _groupValue = '';
  List foodList = [];
  List addFoodList = [];
  final String _desc = '';
  final _descTextCon = TextEditingController();
  bool isSelected = true;
  double starRate = 0.0;
  String foodName = '부타동';
  Where _where = Where.Home;
  TextStyle defaultStyle = const TextStyle(fontSize: 20);
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    print(realHeight);
    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        iconTheme: const IconThemeData(size: 32),
        spacing: 10,
        spaceBetweenChildren: 4,
        backgroundColor: Colors.red,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.camera_alt),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            label: '카메라로 추가하기',
            onTap: () async {
              var res = {};
              res = await predict(context, ImageSource.camera, _picker);
              predResult = res['predata'];
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.photo),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            label: '앨범에서 추가하기',
            onTap: () async {
              var res = {};
              res = await predict(context, ImageSource.gallery, _picker);
              print(res['preData']);
              predResult.addAll(res['preData']);
              isRes = true;
              setState(() {});
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            child: isRes
                ? foodImage()
                : Image.asset(
                    'assets/food/bu.jpg',
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
          ),
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: SizedBox(
              height: realHeight,
              child: Column(
                children: [
                  topBar(
                      searchController: TextEditingController(),
                      title: '등록하기',
                      hint: ''),
                  SizedBox(
                    height: 300,
                    child: Container(color: Colors.transparent),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    width: deviceSize.width,
                    decoration: const BoxDecoration(
                        boxShadow: [],
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
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
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: 0),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)))),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: '성공적으로 등록 되었습니다.');
                                  setState(() {
                                    widget.change();
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Theme.of(context).primaryColor),
                                ),
                                child: const Text(
                                  '등록하기',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget foodImage() {
    var predNo = predResult['predict_no'];
    print(predNo);

    return
        // SliverAppBar(
        //   stretch: true,
        //   onStretchTrigger: () {
        //     // Function callback for stretch
        //     return Future<void>.value();
        //   },
        //   backgroundColor: Colors.white,
        //   expandedHeight: imageHeight,
        //   flexibleSpace: FlexibleSpaceBar(
        //       stretchModes: const <StretchMode>[
        //         StretchMode.zoomBackground,
        //         StretchMode.blurBackground,
        //         StretchMode.fadeTitle,
        //       ],
        //       // 음식 사진 -------------------------------------------------------
        //       background: Container(
        //         color: Colors.red,
        //         child: Center(
        //           child: Stack(
        //             children: <Widget>[
        Image.network(
      'http://203.252.240.74:5000/static/images/$predNo.jpg',
      // fit: BoxFit.fitWidth,
      height: 500,
      headers: const {"Connection": "Keep-Alive"},
    );
    //   // for (var food in foodList) ...[
    //   //   // 바운딩 박스
    //   //   Positioned(
    //   //     left: food['rect']['x'],
    //   //     top: food['rect']['y'],
    //   //     child: Container(
    //   //       width: food['rect']['w'],
    //   //       height: food['rect']['h'],
    //   //       decoration: BoxDecoration(
    //   //         border: Border.all(
    //   //           width: 3,
    //   //           color: food['rect']['color'],
    //   //         ),
    //   //       ),
    //   //     ),
    //   //   ),
    //   //   Positioned(
    //   //       left: food['rect']['x'],
    //   //       top: food['rect']['y'],
    //   //       child: Container(
    //   //         color: food['rect']['color'],
    //   //         padding: const EdgeInsets.fromLTRB(4, 1, 4, 1),
    //   //         child: Text(food['name'],
    //   //             style: const TextStyle(
    //   //                 fontSize: 18,
    //   //                 fontWeight: FontWeight.w500,
    //   //                 color: Colors.white)),
    //   //       ))
    //   ]
    //             ],
    //           ),
    //         ),
    //       )),
    // );
  }
}
