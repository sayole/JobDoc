import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_doc/services/bottomnavi_service.dart';
import 'package:provider/provider.dart';
import 'main_home_type3.dart';
import 'main_home_type4.dart';

List card_list = [];
List card_colors = [
  0xFFF817BFA,
  0xFFF9680EF,
  0xFFF3D7BFC,
  0xFFF63BEBE,
  0xFFF71A5DE,
  0xFFF71A5DE,
  0xFFFB967E0,
  0xFFF89A4E1,
  0xFFF37ABEC,
  0xFFFD790D4,
  0xFFF246DB0,
];

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final btmNav = Provider.of<BtmNavProvider>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                      image: AssetImage('assets/images/blue_logo.png'),
                      width: 75,
                      height: 50),
                  SizedBox(height: 30),
                  Text("더 멋진 미래를 꿈꾸는\n유예지님 환영해요!",
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          fontSize: 26)),
                  SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => btmNav.changeIndex(2),
                        child: Text("내 이력서 수정하기",
                            style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0xFFF3936F1))),
                      ),
                      Image(
                          image: AssetImage('assets/icons/right_arrow.png'),
                          width: 16,
                          height: 16)
                    ],
                  ),
                ],
              ),
            ), // 1번 끝
            SizedBox(height: 40),
            // 여기가 타입2
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('예지님을 기다리고 있는\n컨설턴트님들!',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => btmNav.changeIndex(1),
                            child: Text('모아보기',
                                style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    color: Colors.grey,
                                    fontSize: 16,
                                    letterSpacing: -0.6)),
                          ),
                          Image(
                              image: AssetImage('assets/icons/right_arrow.png'),
                              width: 16,
                              height: 16)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                StreamBuilder<QuerySnapshot<Object?>>(
                  stream: FirebaseFirestore.instance
                      .collection('proposal_list')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      card_list.clear();
                      snapshot.data!.docs.forEach((value) {
                        card_list = [...card_list, value.data()!];
                      });
                      if (card_list.isEmpty) {
                        return Container(
                            height: 300,
                            width: 100,
                            decoration: BoxDecoration(color: Colors.red));
                      } else {
                        return Container(
                          height: 327,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  card_list[index] != 'undefined'
                                      ? proposal_main_card(
                                          card_list[index]["title"],
                                          card_list[index]["tag"],
                                          card_list[index]["text"],
                                          card_list[index]["amount"],
                                          card_colors[index % 10],
                                        )
                                      : SizedBox(height: 2),
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: card_list.length),
                        );
                      }
                    } else {
                      return Text('오류입니다');
                    }
                  },
                ),
                SizedBox(height: 36)
              ],
            ),
            Type3(),
            Type4(),
          ],
        ),
      ),
      // 1번 시작
    );
  }
}

class proposal_main_card extends StatelessWidget {
  late String card_title;
  late String card_tag;
  late String card_text;
  late String card_amount;
  late int card_colors;
  proposal_main_card(this.card_title, this.card_tag, this.card_text,
      this.card_amount, this.card_colors);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      width: 218,
      height: 327,
      decoration: BoxDecoration(color: Color(card_colors)),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 152,
              child: Text(
                card_title,
                style: TextStyle(
                    fontFamily: 'Pretendard',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.6,
                    height: 1.5),
              ),
            ),
            SizedBox(height: 4),
            Container(
              height: 14,
              child: Text(
                card_tag,
                style: TextStyle(
                    fontFamily: 'Pretendard',
                    color: Color(0xFFF3936F1),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.6),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: 192,
              height: 42,
              child: Text(card_text,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            SizedBox(height: 8),
            Image(
                image: AssetImage('assets/images/person1.png'),
                width: 92,
                height: 120),
            SizedBox(height: 8),
            Container(
              width: 152,
              height: 24,
              child: Text(card_amount,
                  style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
