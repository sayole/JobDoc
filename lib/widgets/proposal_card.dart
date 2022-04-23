import 'package:flutter/material.dart';

class proposal_card extends StatelessWidget {
  const proposal_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "2022년 4월 7일 20시 3분",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "자세히 보기 >",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
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
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "#키워드",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "#최대3개",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "#입력가능",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      "컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 컨설턴트 설명을 작성합니다. 최대 세줄까지 가능합니다. 가능합니다 가능합니다 가능합니다",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
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
