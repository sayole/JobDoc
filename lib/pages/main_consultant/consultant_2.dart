import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'consultant_2_profile.dart';

class ConsultantDetail_2 extends StatelessWidget {
  const ConsultantDetail_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "이주의 컨설턴트",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "이번주 잡닥이 선정한 컨설턴트",
                      style: TextStyle(
                        color: Color(0xFFF3D3D3D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.6,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "당신이2최고의 파트너",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "#인사담당3333이직컨설팅",
                      style: TextStyle(
                          color: Color(0xFFF3936F1),
                          fontSize: 14,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 18),
                    Image.asset("assets/images/person2.png", width: 92),
                    SizedBox(height: 40),
                    Text(
                      "LHJ 컨설턴트",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.6,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "꿈을 현실로 만들어 드리는 커리어 코치입니다. 따스한 마음으로 진심을 다하는 커리어 컨설팅 코치입니다. 내면의 잠재력을 찾아 원하는 목표를 달성할 수 있도록 함께 합니다.",
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
                    SizedBox(height: 12),
                    Container(
                      //삼성전자. 삼성바이오로직스, LH공사. 풀무원. 서울대학병원.
                      height: 60,
                      child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: ClipOval(
                              child: Container(
                                height: 60,
                                width: 60,
                                color: Colors.red,
                              ),
                            ),
                          );
                        },
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
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 52,
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
              decoration: BoxDecoration(
                color: Color(0xFFF3936F1),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactInfo2()),
              );
            },
          ),
        ],
      ),
    );
  }
}
