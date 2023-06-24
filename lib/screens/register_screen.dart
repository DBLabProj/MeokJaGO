import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meokjago/apis/detect.dart';
import 'package:http/http.dart';
import 'package:image/image.dart' as libImg;

import '../main.dart';
import 'mypage_screen.dart';

class foodRegisterScreen extends StatefulWidget {
  Function change;
  foodRegisterScreen({super.key, required this.change});

  @override
  State<foodRegisterScreen> createState() => _foodRegisterScreenState();
}

enum Where { Home, Other }

class _foodRegisterScreenState extends State<foodRegisterScreen> {
  double ratio = 0.2;
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
  TextEditingController foodNameControll = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              setState(() {
                predResult.addAll(res['preData']);
                isRes = true;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                topBar(
                    searchController: TextEditingController(),
                    title: '등록하기',
                    hint: ''),
                Container(
                  // height: 300,
                  child: isRes
                      ? foodImage()
                      : Image.asset(
                          'assets/food/bu.jpg',
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
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
                      TextFormField(
                        controller: foodNameControll,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(gapPadding: 0)),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
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
                                Fluttertoast.showToast(msg: '성공적으로 등록 되었습니다.');
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
        ]),
      ),
    );
  }

  Future<List> getFoodInfo(detectInfo, resizeHeight, ratio) async {
    Color boundColors = Colors.red;
    List foodList = [];
    var predNo = predResult['predict_no'];
    String imageUrl = "http://203.252.240.74:5000/static/images/$predNo.jpg";
    int index = 1;

    for (var detection in detectInfo) {
      Map food = {};
      food['name'] = detection['name'].toString();

      Map rect = {};
      rect['x'] = detection['xmin'].toDouble() * ratio;
      rect['y'] = detection['ymin'].toDouble() * ratio;
      rect['w'] = (detection['xmax'].toDouble() * ratio) - rect['x'];
      rect['h'] = (detection['ymax'].toDouble() * ratio) - rect['y'];
      rect['color'] = boundColors;
      // food['acc'] =
      //     (detection['confidence'].toDouble() * 100).toInt().toString();

      food['rect'] = rect;

      food['thumbnail'] =
          await cropNetworkImage(imageUrl, resizeHeight.toInt(), rect);
      food['servingSelected'] = [false, true, false, false];
      foodNameControll.text = food['name'];
      // 음식 영양정보 받아오기
      foodList.add(food);
    }
    return foodList;
  }

  Future<Image> cropNetworkImage(String url, int resizeHeight, Map area) async {
    final rawBytes = (await get(Uri.parse(url))).bodyBytes;
    final img = libImg.decodeJpg(rawBytes);
    libImg.Image resizedImg =
        libImg.copyResize(img!, width: -1, height: resizeHeight);
    libImg.Image cropImg = libImg.copyCrop(resizedImg,
        x: area['x'].toInt(),
        y: area['y'].toInt(),
        width: area['w'].toInt(),
        height: area['h'].toInt());
    return Image.memory(
      Uint8List.fromList(libImg.encodeJpg(cropImg, quality: 100)),
      fit: BoxFit.cover,
    );
  }

  Future preProcess() async {
    double sourceHeight = predResult['image_height'].toDouble();
    double imageHeight = MediaQuery.of(context).size.height * 0.4;
    double ratio = imageHeight / sourceHeight;
    print(ratio);
    List foodList =
        await getFoodInfo(predResult['detection'], imageHeight, ratio);
    return {'foodList': foodList, 'imageHeight': imageHeight};
  }

  Widget foodImage() {
    var predNo = predResult['predict_no'];

    return FutureBuilder(
      future: preProcess(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          imageHeight = snapshot.data['imageHeight'];
          foodList = snapshot.data['foodList'];
          // print(foodList);
          return Stack(children: [
            Image.network(
              'http://203.252.240.74:5000/static/images/$predNo.jpg',
              fit: BoxFit.fitWidth,
            ),
            // 바운딩 박스
            Positioned(
              left: foodList[0]['rect']['x'] * 0.5,
              top: foodList[0]['rect']['y'] * ratio,
              child: Container(
                width: foodList[0]['rect']['w'],
                height: foodList[0]['rect']['h'],
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ]);
        }
        return Container();
      },
    );
  }
}
