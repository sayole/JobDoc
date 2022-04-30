import 'package:flutter/material.dart';
import 'package:job_doc/models/user_data.dart';
import 'main_home_type2.dart';
import 'main_home_type3.dart';
import 'main_home_type4.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // 1번 시작
                SizedBox(height: 40),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterLogo(size: 40),
                        Text("~~~하는\n유예지님 환영해요",
                            style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                fontSize: 26)),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("내 이력서 수정하기",
                                style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xFFF3936F1))),
                            Image(
                                image:
                                    AssetImage('assets/icons/right_arrow.png'),
                                width: 16,
                                height: 16)
                          ],
                        ),
                      ],
                    ),
                  ),
                ), // 1번 끝
                SizedBox(height: 40),
                Type2(),
                Type3(),
                Type4(),
              ],
            ),
          )
        ],
      ),
    );
  }
}