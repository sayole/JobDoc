import 'package:flutter/material.dart';

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

class Type2 extends StatelessWidget {
  const Type2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
              SizedBox(width: 80),
              GestureDetector(
                onTap: () {
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
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 16),
              ...List.generate(10, (index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 218,
                      child: GestureDetector(
                        onTap: () {
                          print("가나다");
                        },
                        child: Container(
                          width: double.infinity,
                          height: 327,
                          decoration:
                              BoxDecoration(color: Color(card_colors[index])),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('컨설턴트 한줄소개는\n20자이내로만',
                                    style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      '#가나다',
                                      style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          color: Color(0xFFF3936F1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '#해시태그',
                                      style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          color: Color(0xFFF3936F1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '#누군가',
                                      style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          color: Color(0xFFF3936F1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Container(
                                  width: 192,
                                  height: 42,
                                  child: Text(
                                      '컨설턴트3명 컨설턴트 3명 컨설턴트 3명\n컨설턴트3명 컨설턴트 3명 \n컨설턴트 3명',
                                      style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                                SizedBox(height: 8),
                                Image(
                                    image: AssetImage(
                                        'assets/images/sign_in_image.png'),
                                    width: 92,
                                    height: 120),
                                SizedBox(height: 8),
                                Text("월 3만원",
                                    style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                );
              }),
              SizedBox(width: 8),
            ],
          ),
        ),
        SizedBox(height: 36)
      ],
    );
  }
}
