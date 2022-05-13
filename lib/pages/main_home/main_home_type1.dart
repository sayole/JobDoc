import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_doc/services/bottomnavi_service.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';
import 'main_home_type3.dart';
import 'main_home_type4.dart';
import 'dart:ui';

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

List card_color_grey = [0xFFFBDBDBD];

List card_images = [
  'assets/images/person1.png',
  'assets/images/person2.png',
  'assets/images/person3.png',
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
    return Consumer<UserService>(builder: (context, userService, child) {
      return FutureBuilder<QuerySnapshot>(
          future: userService.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              final documents = snapshot.data?.docs ?? [];
              final doc = documents[0];
              return Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                  image:
                                      AssetImage('assets/images/blue_logo.png'),
                                  width: 75,
                                  height: 50),
                              SizedBox(height: 30),
                              Text("더 멋진 미래를 꿈꾸는\n${doc.get('name')}님 환영해요!",
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
                                      image: AssetImage(
                                          'assets/icons/right_arrow.png'),
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
                              padding:
                                  const EdgeInsets.only(left: 24.0, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('${doc.get('name')}님을 기다리고 있는\n컨설턴트님들!',
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
                                          image: AssetImage(
                                              'assets/icons/right_arrow.png'),
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
                                  .where('user_id',
                                      isEqualTo: userService.currentUser()?.uid)
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
                                      height: 327,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Stack(
                                            children: [
                                              proposal_main_card(
                                                  "당신의 더 나은 미래 응원합니다",
                                                  "#신뢰적 #동행 #멋진사람",
                                                  "잡닥은 많은 커리어 컨설턴트를 보유하고 있으며, 이는 곧 고객님의 더 나은 미래를 위해 노력합니다.",
                                                  "300,000원",
                                                  card_color_grey[0],
                                                  card_images[0]),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                width: 248,
                                                height: 327,
                                                child: GlassMorphism(
                                                  opacity: 0.1,
                                                  blur: 3,
                                                  child: Center(
                                                      child: Text(
                                                    "아직 컨설턴트의 제안서가\n도착하지 않았어요.\n도착하면 바로 알려드릴게요!",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    textAlign: TextAlign.center,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              proposal_main_card(
                                                  "당신의 더 나은 미래 응원합니다",
                                                  "#신뢰적 #동행 #멋진사람",
                                                  "잡닥은 많은 커리어 컨설턴트를 보유하고 있으며, 이는 곧 고객님의 더 나은 미래를 위해 노력합니다.",
                                                  "300,000원",
                                                  card_color_grey[0],
                                                  card_images[0]),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                width: 248,
                                                height: 327,
                                                child: GlassMorphism(
                                                  opacity: 0.2,
                                                  blur: 3,
                                                  child: Center(
                                                      child: Text(
                                                    "아직 컨설턴트의 제안서가\n도착하지 않았어요.\n도착하면 바로 알려드릴게요!",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    textAlign: TextAlign.center,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                    // Container(
                                    //   height: 327,
                                    //   width: 218,
                                    //   decoration:
                                    //       BoxDecoration(color: Colors.grey),
                                    //   child: Center(
                                    //     child: Text(
                                    //       "아직 컨설턴트의 제안서가\n도착하지 않았어요.\n도착하면 바로 알려드릴게요!",
                                    //       textAlign: TextAlign.center,
                                    //       style: TextStyle(
                                    //           fontWeight: FontWeight.w700),
                                    //     ),
                                    //   ),
                                    // );
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
                                                      card_list[index]
                                                          ["amount"],
                                                      card_colors[index % 10],
                                                      card_images[index % 3],
                                                    )
                                                  : SizedBox(height: 2),
                                          separatorBuilder: (context, index) =>
                                              Divider(),
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
                ),
                // 1번 시작
              );
            }
          });
    });
  }
}

class proposal_main_card extends StatelessWidget {
  late String card_title;
  late String card_tag;
  late String card_text;
  late String card_amount;
  late int card_colors;
  late String card_images;
  proposal_main_card(this.card_title, this.card_tag, this.card_text,
      this.card_amount, this.card_colors, this.card_images);
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
            Image(image: AssetImage(card_images), width: 92, height: 120),
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

class GlassMorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;

  const GlassMorphism({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border:
                Border.all(width: 1.5, color: Colors.white.withOpacity(0.2)),
          ),
          child: child,
        ),
      ),
    );
  }
}
