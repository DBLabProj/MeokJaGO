import 'package:flutter/material.dart';
import 'package:meokjago/screens/home_screen.dart';
import 'package:meokjago/screens/signup_screen.dart';

class loginToolBox extends StatefulWidget {
  const loginToolBox({super.key});

  @override
  State<loginToolBox> createState() => _loginToolBoxState();
}

class _loginToolBoxState extends State<loginToolBox> {
  bool? rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
            value: rememberMe,
            onChanged: ((value) {
              setState(() {
                rememberMe = value;
              });
            })),
        Row(
          children: const [
            Text('아이디 찾기'),
            Text('|'),
            Text('패스워드 찾기'),
          ],
        ),
      ],
    );
  }
}

class loginBackground extends StatelessWidget {
  const loginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      // color: Theme.of(context).primaryColor,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              const Text(
                '먹자GO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// ------------------------------------입력 상자 -------------------------------------------------
class loginTextbox extends StatefulWidget {
  Icon icon;
  String dataType;
  TextEditingController controller;
  loginTextbox(
      {super.key,
      required this.icon,
      required this.dataType,
      required this.controller});

  @override
  State<loginTextbox> createState() => _loginTextboxState();
}

class _loginTextboxState extends State<loginTextbox> {
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
          widget.icon,
          Flexible(
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.dataType != '아이디' ? true : false,
              decoration: InputDecoration(
                  labelText: widget.dataType, border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------입력 상자 -------------------------------------------------
class loginButton extends StatelessWidget {
  double parentWidth;
  loginButton({super.key, required this.parentWidth});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = parentWidth * 0.75;
    return Column(
      children: [
        SizedBox(
          width: buttonWidth,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor:
                      MaterialStatePropertyAll(Theme.of(context).primaryColor)),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const homeScreen()),
                );
              },
              child: const Text(
                '로그인',
                style: TextStyle(),
              )),
        ),
        SizedBox(
          width: buttonWidth,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2)),
              ),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => const signupScreen()));
            },
            child: Text(
              '회원가입',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 회원가입 제출
class submitSignUp extends StatelessWidget {
  String domain;
  Function checkUsername;
  submitSignUp({
    super.key,
    required this.domain,
    required this.checkUsername,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side:
                  BorderSide(color: Theme.of(context).primaryColor, width: 2)),
        ),
        backgroundColor: const MaterialStatePropertyAll(Colors.white),
      ),
      onPressed: () {
        // Navigator.push((context),
        // MaterialPageRoute(builder: (context) => const signUpPage()));
        checkUsername();
      },
      child: Text(
        '회원가입',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
