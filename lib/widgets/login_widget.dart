import 'package:flutter/material.dart';
import 'package:meokjago/main.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: ((value) {
                setState(() {
                  rememberMe = value;
                });
              }),
            ),
            const Text(
              '로그인 정보 기억하기',
              textScaleFactor: 0.9,
            )
          ],
        ),
        Row(
          children: const [
            Text(
              '아이디 찾기',
              textScaleFactor: 0.9,
            ),
            Text(
              '|',
              textScaleFactor: 0.9,
            ),
            Text(
              '패스워드 찾기',
              textScaleFactor: 0.9,
            ),
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
      height: MediaQuery.of(context).size.height * 0.32,
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
                '\n',
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
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.dataType == '비밀번호',
      decoration:
          InputDecoration(prefixIcon: widget.icon, labelText: widget.dataType),
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
    return SizedBox(
      height: deviceSize.height * 0.133,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: double.infinity,
            height: deviceSize.height * 0.06,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor)),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                },
                child: const Text(
                  '로그인',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
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
                          color: Theme.of(context).primaryColor, width: 2)),
                ),
                backgroundColor: const MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed((context), '/signup');
              },
              child: Text(
                '회원가입',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
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
