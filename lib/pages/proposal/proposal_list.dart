import 'package:flutter/material.dart';

class proposal_list extends StatelessWidget {
  const proposal_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "나의견적",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return proposal_card();
        },
      ),
    );
  }
}

class proposal_card extends StatelessWidget {
  const proposal_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "2022년 4월 7일 20시 3분",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Text(
                      "자세히 보기",
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: -0.6,
                      ),
                    ),
                    Image.asset(
                      "assets/icons/right_arrow.png",
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF6962FF),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, bottom: 12, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "컨설턴트의 한줄소개는 20자 이내로만",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "#키워드 #3개까지 #쌉가능",
                    style: TextStyle(
                        color: Color(0xFFF3936F1),
                        fontSize: 10,
                        letterSpacing: -0.6,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 192,
                    child: Text(
                      "컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 최대 세줄까지 가능합니다. 가능합니다 가능합니다",
                      style: TextStyle(
                        color: Color(0xFFF3D3D3D),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        letterSpacing: -0.6,
                      ),
                    ),
                  ),
                  SizedBox(height: 56),
                  Text(
                    "월 300,000원~",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
