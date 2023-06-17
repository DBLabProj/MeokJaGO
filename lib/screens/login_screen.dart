import 'package:flutter/material.dart';
import 'package:meokjago/main.dart';
import 'package:meokjago/widgets/login_widget.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double areaWidth = deviceSize.width * 0.9;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: deviceSize.height - MediaQuery.of(context).padding.vertical,
          child: Stack(
            children: [
              const loginBackground(),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.21,
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.05,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.67,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: Colors.white,
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '로그인',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                loginTextbox(
                                  icon:
                                      const Icon(Icons.account_circle_outlined),
                                  dataType: '아이디',
                                  controller: idController,
                                ),
                                Column(
                                  children: [
                                    loginTextbox(
                                      icon: const Icon(Icons.key),
                                      dataType: '비밀번호',
                                      controller: pwController,
                                    ),
                                    const loginToolBox(),
                                  ],
                                ),
                              ],
                            ),
                            loginButton(
                              parentWidth: areaWidth,
                            ),
                          ],
                        ),
                      ),
                    ),
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
