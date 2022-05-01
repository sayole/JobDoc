import 'package:flutter/material.dart';

class Type4 extends StatelessWidget {
  const Type4({Key? key}) : super(key: key);

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
              Container(
                width: 343,
                height: 98,
                child: Text(
                    'Re-bye팀\n이메일: jobdoc-rebye@gmail.com\n문의하기: 환경설정의 문의하기 클릭\n\n현재 베타서비스를 운영 중에 있으며 잡닥은 컨설턴트와의 매칭까지 도움을 드립니다. 매칭 이후 컨설턴트가 제공하는 상품/서비스에 대한 거래 정보 및 거래와 관련하여 잡닥은 중개자로서 일체 책임을 지지 않습니다.',
                    style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.6,
                        color: Colors.grey,
                        height: 1.2)),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
