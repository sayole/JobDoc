import 'package:flutter/material.dart';
import 'package:job_doc/pages/proposal/proposal_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Type2 extends StatelessWidget {
  Type2({Key? key}) : super(key: key);

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

  List card_list = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('예지님을 기다리고 있는\n컨설턴트',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.6,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProposalList()),
                      // currentIndex =2
                    );
                    print('나의 견적으로 이동');
                  },
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
          ),
        ),
        SizedBox(height: 12),
        // 파이어스토어와 연동하여 데이터를 가져오고, 파이어스토어에 필드를 추가해서 트루인 것만 가져오고 나오게 처리
        // 특정 필드가 트루인 것들만 가져오기, 파이어스토어 쿼리
        // 데이터 연동 이후
        // 선별적으로 가여조고, 리스트 뷰 빌더로 쓰기
        SizedBox(width: 16),
        StreamBuilder<QuerySnapshot<Object?>>(
            stream: FirebaseFirestore.instance
                .collection('proposal_list')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                snapshot.data!.docs.forEach((value) {
                  card_list = [...card_list, value.data()!];
                });
                return Container(
                  height: 400,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          card_list[index] != 'undefined'
                              ? proposal_main_card(
                                  card_list[index]["title"],
                                  card_list[index]["tag"],
                                  card_list[index]["text"],
                                  card_list[index]["amount"],
                                  card_colors[index % 10],
                                )
                              : SizedBox(),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: card_list.length),
                );
              }
            }),
        // ...List.generate(10, (index) {
        //   return Row(
        //     children: [
        //       SizedBox(
        //         width: 218,
        //         child: GestureDetector(
        //           onTap: () {
        //             print("가나다");
        //           },
        //           child: Container(
        //             width: double.infinity,
        //             height: 327,
        //             decoration:
        //                 BoxDecoration(color: Color(card_colors[index])),
        //             child: Padding(
        //               padding: const EdgeInsets.only(left: 16.0),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Container(
        //                     width: 192,
        //                     child: Text('컨설턴트 소개는 20자 이내로 하면 자동',
        //                         style: TextStyle(
        //                             fontFamily: 'Pretendard',
        //                             color: Colors.white,
        //                             fontSize: 20,
        //                             fontWeight: FontWeight.bold)),
        //                   ),
        //                   SizedBox(height: 4),
        //                   Text(
        //                     '#해시태그1 #해시태그2 #해시태그3',
        //                     style: TextStyle(
        //                         fontFamily: 'Pretendard',
        //                         color: Color(0xFFF3936F1),
        //                         fontSize: 12,
        //                         fontWeight: FontWeight.bold),
        //                   ),
        //                   SizedBox(height: 12),
        //                   Container(
        //                     width: 192,
        //                     height: 42,
        //                     child: Text(
        //                         'ㅋㅋㅋㅋㅋㅋㅋ111111111ㅋㅋㅋㅋㅋㅋㅋ1111111111122222222222223333333333333333333',
        //                         style: TextStyle(
        //                           fontFamily: 'Pretendard',
        //                           color: Colors.white,
        //                           fontSize: 10,
        //                           fontWeight: FontWeight.w400,
        //                         )),
        //                   ),
        //                   SizedBox(height: 8),
        //                   Image(
        //                       image: AssetImage(
        //                           'assets/images/sign_in_image.png'),
        //                       width: 92,
        //                       height: 120),
        //                   SizedBox(height: 8),
        //                   Text("월 3만원",
        //                       style: TextStyle(
        //                           fontFamily: 'Pretendard',
        //                           fontSize: 16,
        //                           color: Colors.white,
        //                           fontWeight: FontWeight.w600)),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       SizedBox(width: 8),
        //     ],
        //   );
        // }),
        SizedBox(width: 8),
      ],
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
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(color: Color(card_colors)),
            width: 192,
            child: Text(card_title,
                style: TextStyle(
                    fontFamily: 'Pretendard',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 4),
          Text(
            card_tag,
            style: TextStyle(
                fontFamily: 'Pretendard',
                color: Color(0xFFF3936F1),
                fontSize: 12,
                fontWeight: FontWeight.bold),
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
              image: AssetImage('assets/images/sign_in_image.png'),
              width: 92,
              height: 120),
          SizedBox(height: 8),
          Text(card_amount,
              style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
