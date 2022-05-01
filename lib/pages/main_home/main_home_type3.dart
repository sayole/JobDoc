import 'package:flutter/material.dart';

class Type3 extends StatelessWidget {
  const Type3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('예지님의 이력서를 바탕으로\n추천드리는 컨설턴트',
              style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.6)),
        ),
        SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            print('해당 첫번째 분으로 이동 견적으로 이동');
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            child: Row(
              children: [
                Image(
                    image: AssetImage('assets/images/sign_in_image.png'),
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
                            '컨설턴트1',
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
                      "#해시태그1  #해시태그2  #해시태그3",
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          color: Color(0xFFF3936F1),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.6),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "컨설턴트 설명을 2줄이상 컨설턴트 설명을 2줄이상\n컨설턴트 설명을 2줄이상컨설턴트 설명을 2줄이상컨설턴트 설명을 2줄이상",
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
            print('해당 두번째 푼으로 이동 견적으로 이동');
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            child: Row(
              children: [
                Image(
                    image: AssetImage('assets/images/sign_in_image.png'),
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
                            '컨설턴트 2',
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
                      "#해시태그1  #해시태그2  #해시태그3",
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          color: Color(0xFFF3936F1),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.6),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "컨설턴트 설명을 2줄이상 컨설턴트 설명을 2줄이상\n컨설턴트 설명을 2줄이상컨설턴트 설명을 2줄이상컨설턴트 설명을 2줄이상",
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
            print('해당 세번째 푼으로 이동 견적으로 이동');
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Row(
              children: [
                Image(
                    image: AssetImage('assets/images/sign_in_image.png'),
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
                            '컨설턴트 3',
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
                          "#해시태그1  #해시태그2  #해시태그3",
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
                      "컨설턴트 설명을 2줄이상 컨설턴트 설명을 2줄이상\n컨설턴트 설명을 2줄이상컨설턴트 설명을 2줄이상컨설턴트 설명을 2줄이상",
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
