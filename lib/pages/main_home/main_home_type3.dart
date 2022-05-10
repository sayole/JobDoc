import 'package:flutter/material.dart';

import '../main_consultant/consultant_1.dart';
import '../main_consultant/consultant_2.dart';
import '../main_consultant/consultatn_3.dart';

class Type3 extends StatelessWidget {
  const Type3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('잡닥이 선정한 인기 많은\n이주의 추천 컨설턴트',
              style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.6)),
        ),
        SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConsultantDetail_1()),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            child: Row(
              children: [
                Image(
                    image: AssetImage('assets/images/person3.png'),
                    width: 64,
                    height: 83),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 24,
                          child: Text(
                            'LJH',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.6,
                                fontSize: 16,
                                height: 1.4),
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/icons/right_arrow.png'),
                          width: 16,
                          height: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      "#인사담당자98%만족도 #자소서코칭 #면접코칭 #이직컨설팅",
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          color: Color(0xFFF3936F1),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.6),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "꿈을 현실로 만들어 드리는 커리어 코치입니다.\n내면의 잠재력을 찾아 원하는 목표를 달성할 수 있도록 함께 합니다.",
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          color: Colors.black,
                          fontSize: 10,
                          letterSpacing: -0.6),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConsultantDetail_2()),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            child: Row(
              children: [
                Image(
                    image: AssetImage('assets/images/person2.png'),
                    width: 64,
                    height: 83),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 24,
                          child: Text(
                            'ABCHR',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.6,
                                fontSize: 16,
                                height: 1.4),
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/icons/right_arrow.png'),
                          width: 16,
                          height: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      "#신뢰 #동행 #헤드헌팅",
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          color: Color(0xFFF3936F1),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.6),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "15년 동안 다양한 기업과 직무를 진행하였고, 10,000 명에 가까운\n후보자들과 소통하면서 얻은 경험과 지혜를 함께 나누기를 희망합니다.",
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          color: Colors.black,
                          fontSize: 10,
                          letterSpacing: -0.6),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConsultantDetail_3()),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Row(
              children: [
                Image(
                    image: AssetImage('assets/images/person1.png'),
                    width: 64,
                    height: 83),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 24,
                          child: Text(
                            '엄취쌤',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.6,
                                fontSize: 16,
                                height: 1.4),
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/icons/right_arrow.png'),
                          width: 16,
                          height: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          "#논리적 #이성적 #합리적",
                          style: TextStyle(
                              fontFamily: 'Pretendard',
                              color: Color(0xFFF3936F1),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.6),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      '"엄마! 나 취업했어!" 라고 외치는 날을 기다리고 있나요?\n취업준비생 약 300명 컨설팅 경력의 엄취쌤이 붙게 만들어드립니다!',
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          color: Colors.black,
                          fontSize: 10,
                          letterSpacing: -0.6),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
