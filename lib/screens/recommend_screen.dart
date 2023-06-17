import 'package:flutter/material.dart';
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
                            child: GridView.builder(
                              itemCount: 12,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                bool isExpand = false;
                                return GestureDetector(
                                  onTap: () => isExpand = !isExpand,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.network(
                                            'https://i.namu.wiki/i/1LrnduayLqi_dZMEGSyhUfDsNA-Bhu-R7MRvTC8G-r04keOU6kptPtxoUI8hy5eT1Q3_4r6MffH3On6fCjW1xQ.webp',
                                            width: 70,
                                            height: 70,
                                          ),
                                          const Text(
                                            '바질 크림 파스타',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
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
                              const MaterialStatePropertyAll(Colors.white),
                        ),
                        child: Text(
                          '새로고침',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColor)),
                        child: const Text(
                          "회원가입",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class recommendCard extends StatefulWidget {
  const recommendCard({super.key});

  @override
  State<recommendCard> createState() => _recommendCardState();
}

class _recommendCardState extends State<recommendCard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
