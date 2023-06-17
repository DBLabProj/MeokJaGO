import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meokjago/apis/login_api.dart';
import 'package:meokjago/main.dart';
import 'package:meokjago/models/user.dart';
import 'package:meokjago/widgets/login_widget.dart';
import 'package:http/http.dart' as http;
import 'package:multi_masked_formatter/multi_masked_formatter.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  var formKey = GlobalKey<FormState>();
  bool pwChecked = false;
  TextEditingController userIdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwCheckController = TextEditingController();

  checkUsername() async {
    try {
      var response = await http.post(Uri.parse(API.validateName),
          body: {'user_name': userIdController.text.trim()});

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['existName'] == true) {
          Fluttertoast.showToast(
            msg: "이미 존재하는 사용자 이름입니다.",
          );
        } else {
          saveInfo();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  saveInfo() async {
    User userModel = User(
      1,
      userIdController.text.trim(),
      emailController.text.trim(),
      phoneController.text.trim(),
      pwController.text.trim(),
    );
    print(userModel.toJson());
    try {
      var res =
          await http.post(Uri.parse(API.signUp), body: userModel.toJson());
      if (res.statusCode == 200) {
        var resSignup = jsonDecode(res.body);
        if (resSignup['success'] == true) {
          Fluttertoast.showToast(msg: 'Signup successfully');
          setState(() {
            userIdController.clear();
            emailController.clear();
            pwController.clear();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const appFrame()));
          });
        } else {
          Fluttertoast.showToast(msg: 'Error occurred. Please try again');
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Stack(
            children: [
              const loginBackground(),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.height * 0.21,
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.height * 0.05),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.67,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '회원가입',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextFormField(
                                  controller: userIdController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                          Icons.account_circle_outlined),
                                      labelText: '아이디',
                                      suffixIcon: Column(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Theme.of(context)
                                                              .primaryColor)),
                                              child: const Text('중복 확인')),
                                        ],
                                      )),
                                ),
                                emailTextbox(
                                  emailController: emailController,
                                ),
                                phoneTextbox(phoneController: phoneController),
                                TextFormField(
                                  controller: pwController,
                                  obscureText: true,
                                  onChanged: (value) {
                                    pwCheckController.text == pwController.text
                                        ? pwChecked = true
                                        : pwChecked = false;
                                    setState(() {
                                      pwChecked;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.key),
                                      labelText: '패스워드'),
                                ),
                                const Text(
                                  '*영어ᐧ숫자ᐧ특수문자 조합 10자 이상',
                                  textScaleFactor: 0.9,
                                  style: TextStyle(color: Colors.red),
                                ),
                                TextFormField(
                                  controller: pwCheckController,
                                  onChanged: (value) {
                                    pwCheckController.text == pwController.text
                                        ? pwChecked = true
                                        : pwChecked = false;
                                    setState(() {
                                      pwChecked;
                                    });
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.key),
                                      labelText: '패스워드 확인'),
                                ),
                                pwChecked && pwController.text.isNotEmpty
                                    ? const Text('')
                                    : const Text(
                                        '*패스워드가 일치하지 않습니다.',
                                        textScaleFactor: 0.9,
                                        style: TextStyle(color: Colors.red),
                                      )
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: deviceSize.height * 0.06,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2)),
                                  ),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      (context), '/signup/recommend');
                                },
                                child: Text(
                                  '회원가입',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

// 전화번호
class phoneTextbox extends StatefulWidget {
  TextEditingController phoneController;
  phoneTextbox({super.key, required this.phoneController});

  @override
  State<phoneTextbox> createState() => _phoneTextboxState();
}

class _phoneTextboxState extends State<phoneTextbox> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.phoneController,
      inputFormatters: [
        MultiMaskedTextInputFormatter(
            masks: ['xxx-xxxx-xxxx', 'xxx-xxx-xxxx'], separator: '-'),
      ],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.phone_android_rounded),
        labelText: '휴대전화',
      ),
    );
  }
}

// 이메일
class emailTextbox extends StatefulWidget {
  TextEditingController emailController;
  emailTextbox({
    super.key,
    required this.emailController,
  });

  @override
  State<emailTextbox> createState() => _emailTextboxState();
}

class _emailTextboxState extends State<emailTextbox> {
  final List<String> _emailList = ['@google.com', '@naver.com', '@hanmail.net'];
  String _selectedValue = '@google.com';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter(RegExp("[a-z|0-9]"), allow: true),
      ],
      onChanged: (value) {
        widget.emailController.text = value + _selectedValue;
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email_outlined),
          labelText: '이메일',
          suffixIcon: DropdownButton(
            value: _selectedValue,
            items: _emailList.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          )),
    );
  }
}
