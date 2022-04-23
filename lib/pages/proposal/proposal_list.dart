import 'package:flutter/material.dart';

class proposal_list extends StatelessWidget {
  proposal_list({Key? key}) : super(key: key);

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

  List card_list = [
    {
      "card_date": "2022년 04월 23일",
      "card_title": "컨설턴트의 한줄소개는 20자 이내로만",
      "card_tag": "#키워드 #최대3개 #입력가능",
      "card_text":
          "컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 최대 세줄까지 가능합니다. 가능합니다 가능합니다 가능합니다",
      "card_amount": "월 300,000원~"
    },
    {
      "card_date": "2022년 04월 23일",
      "card_title": "컨설턴트의 한줄소개는 20자 이내로만",
      "card_tag": "#키워드 #최대3개 #입력가능",
      "card_text":
          "컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 최대 세줄까지 가능합니다. 가능합니다 가능합니다 가능합니다",
      "card_amount": "월 300,000원~",
    },
    {
      "card_date": "2022년 04월 23일",
      "card_title": "컨설턴트의 한줄소개는 20자 이내로만",
      "card_tag": "#키워드 #최대3개 #입력가능",
      "card_text":
          "컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 최대 세줄까지 가능합니다. 가능합니다 가능합니다 가능합니다",
      "card_amount": "월 300,000원~",
    },
    {
      "card_date": "2022년 04월 23일",
      "card_title": "컨설턴트의 한줄소개는 20자 이내로만",
      "card_tag": "#키워드 #최대3개 #입력가능",
      "card_text":
          "컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 최대 세줄까지 가능합니다. 가능합니다 가능합니다 가능합니다",
      "card_amount": "월 300,000원~",
    },
  ];

  @override
  Widget build(BuildContext context) {
    print(card_list[0]);
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
        itemCount: card_list.length,
        itemBuilder: (BuildContext context, int index) {
          return proposal_card(
            card_list[index]["card_date"],
            card_list[index]["card_title"],
            card_list[index]["card_tag"],
            card_list[index]["card_text"],
            card_list[index]["card_amount"],
            card_colors[index],
          );
          // Container(
          //   child: Text(card_list[index]["card_date"]),
          // );
        },
      ),
    );
  }
}

class proposal_card extends StatelessWidget {
  late String card_date;
  late String card_title;
  late String card_tag;
  late String card_text;
  late String card_amount;
  late int card_colors;

  proposal_card(this.card_date, this.card_title, this.card_tag, this.card_text,
      this.card_amount, this.card_colors);

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
                card_date,
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
              color: Color(card_colors),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, bottom: 12, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card_title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    card_tag,
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
                      card_text,
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
                    card_amount,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: -0.6,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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
