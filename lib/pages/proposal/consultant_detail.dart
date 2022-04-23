import 'package:flutter/material.dart';

class consultant_detail extends StatelessWidget {
  const consultant_detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "견적 상세 내용",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2022년 4월 7일 19시 3분",
                    style: TextStyle(
                      color: Color(0xFFF3D3D3D),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "컨설턴트의 한줄소개는 20자 이내로만",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "#키워드 #3개까지 #쌉가능",
                    style: TextStyle(
                        color: Color(0xFFF3936F1),
                        fontSize: 14,
                        letterSpacing: -0.6,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 18),
                  Image.asset("assets/images/person01.png", width: 92),
                  SizedBox(height: 40),
                  Text(
                    "컨설턴트 누구누구 자기 닉네임",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "컨설턴 됩니다.컨설턴트가 하고 싶은 말을 쓰면 됩니다.컨설턴트가 하고 싶은 말을 쓰면 됩니다. 컨설턴트가 하고 싶은컨설턴 됩니다.컨설턴트가 하고 싶은 말을 쓰면 됩니다.컨설턴트가 하고 싶은 말을 쓰면 됩니다. 컨설턴트가 하고 싶은컨설턴 됩니다.컨설턴트가 하고 싶은 말을 쓰면 됩니다.컨설턴트",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "컨설턴트가 합격시킨 기업",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.6,
                    ),
                  ),
                  // 여기에 이미지를 넣어야함.
                  SizedBox(height: 40),
                  Text(
                    "서비스 소개",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text("여기에 서비스 소개"),
                  SizedBox(height: 40),
                  Text(
                    "컨설턴트 후기",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100,
                          width: 100,
                          color: Colors.red,
                          margin: EdgeInsets.only(right: 8),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "견적 제안",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "* 비용 거래는 컨설턴트와 직접 해요. 결제와 관련해서 문제가 생길 경우 잡닥 문의하기를 통해 문의해주세요.",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "월 결제 금액",
                        style: TextStyle(
                          color: Color(0xFFF3D3D3D),
                          fontSize: 16,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "총 100,000원",
                        style: TextStyle(
                          color: Color(0xFFF3D3D3D),
                          fontSize: 16,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "예상 금액",
                        style: TextStyle(
                          color: Color(0xFFF3D3D3D),
                          fontSize: 16,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "총 100,000원",
                        style: TextStyle(
                          color: Color(0xFFF3D3D3D),
                          fontSize: 16,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(
                    color: Color(0xFFF3936F1),
                    height: 1,
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "총 결제 금액",
                        style: TextStyle(
                          color: Color(0xFFF3D3D3D),
                          fontSize: 16,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "100,000원",
                        style: TextStyle(
                          color: Color(0xFFF3936F1),
                          fontSize: 16,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    "이 컨설턴트와 상담하기",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: -0.6,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                height: 52,
                decoration: BoxDecoration(
                  color: Color(0xFFF3936F1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
