import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meokjago/apis/login_api.dart';
import 'package:meokjago/models/user.dart';
import 'package:meokjago/screens/home_screen.dart';
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
  bool isSecondPage = false;
  var userNameController = TextEditingController();
  var domainName = 'google.com';
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var pwController = TextEditingController();
  var pwCheckController = TextEditingController();

  changeDomain(String domain) {
    setState(() {
      domainName = domain;
    });
  }

  changePage() {
    setState(() {
      isSecondPage = !isSecondPage;
    });
  }

  checkUsername() async {
    try {
      var response = await http.post(Uri.parse(API.validateName),
          body: {'user_name': userNameController.text.trim()});

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
      userNameController.text.trim(),
      '${emailController.text.trim()}@${domainName.trim()}',
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
            userNameController.clear();
            emailController.clear();
            pwController.clear();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const homeScreen()));
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
          child: Stack(
        children: [
          const loginBackground(),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.height * 0.21,
                MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.height * 0.05),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: Colors.white,
              child: GestureDetector(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        loginTextbox(
                            icon: const Icon(Icons.account_circle_outlined),
                            dataType: '닉네임',
                            controller: userNameController),
                        emailTextbox(
                            emailController: emailController,
                            changeDomain: changeDomain),
                        phoneTextbox(phoneController: phoneController),
                        loginTextbox(
                          icon: const Icon(Icons.key),
                          dataType: '비밀번호',
                          controller: pwController,
                        ),
                        loginTextbox(
                          icon: const Icon(Icons.key),
                          dataType: '비밀번호 확인',
                          controller: pwCheckController,
                        ),
                        submitSignUp(
                          domain: domainName,
                          checkUsername: checkUsername,
                        )
                      ],
                    )),
              ),
            ),
          ),
        ],
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
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1.5, color: Colors.grey.withOpacity(0.4)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.phone_android_rounded),
          Flexible(
              child: TextField(
            controller: widget.phoneController,
            inputFormatters: [
              MultiMaskedTextInputFormatter(
                  masks: ['xxx-xxxx-xxxx', 'xxx-xxx-xxxx'], separator: '-'),
            ],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: '휴대전화', border: InputBorder.none),
          )),
        ],
      ),
    );
  }
}

// 이메일
class emailTextbox extends StatefulWidget {
  var emailController;
  Function changeDomain;
  emailTextbox({
    super.key,
    required this.emailController,
    required this.changeDomain,
  });

  @override
  State<emailTextbox> createState() => _emailTextboxState();
}

class _emailTextboxState extends State<emailTextbox> {
  final List<String> _emailList = ['google.com', 'naver.com', 'hanmail.net'];
  String _selectedValue = 'google.com';
  @override
  Widget build(BuildContext context) {
    String email = widget.emailController.text + '@' + _selectedValue;
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1.5, color: Colors.grey.withOpacity(0.4)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.email_outlined),
          Flexible(
            child: TextFormField(
              controller: widget.emailController,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp("[a-z|0-9]"), allow: true),
              ],
              decoration: const InputDecoration(
                  hintText: '이메일', border: InputBorder.none, labelText: '이메일'),
            ),
          ),
          const Icon(Icons.alternate_email),
          DropdownButton(
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
                widget.changeDomain(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
