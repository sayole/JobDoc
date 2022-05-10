import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'consultant_2_profile.dart';

class ConsultantDetail_2 extends StatelessWidget {
  const ConsultantDetail_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var company_list = [
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fcoupang.png?alt=media&token=34778eae-d5e8-4394-937d-793fb1ca2a9b',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fline.png?alt=media&token=3d87f2e5-177e-4a67-bd7d-d7b2116d4fde',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fswit.png?alt=media&token=3c74a516-8db9-41cb-9422-82e155d01171',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fmashkorea.png?alt=media&token=5ae34e8e-430e-41d8-8da4-41addefd7e08',
    ];

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
                      "신뢰와 동행으로 고객의 우수한 재능을 발휘할 수 있도록 돕겠습니다",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "#신뢰 #동행 #헤드헌팅",
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
                      "ABCHR 컨설턴트",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.6,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "2005년 봄부터 시작한 헤드헌팅 업무를 15년 넘게 수행하면서 다양한 기업과 직무를 진행하였고, 10,000 명에 가까운 후보자들과 소통하면서 얻은 경험과 지혜를 함께 나누기를 희망합니다. 감사합니다.",
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
                        itemCount: company_list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                company_list[index],
                                fit: BoxFit.fitWidth,
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
                    Text(
                        "커리어 코칭 비용\n1. 취업컨설팅(자기소개서 및 이력서 첨삭)\n- 오프라인 미팅 60분 당 10만원(온라인 및 화상, 전화 미팅 시에는 20% 할인)\n2. 면접컨설팅\n- 오프라인 미팅 60분 당 10만원(온라인 및 화상, 전화 미팅 시에는 20% 할인)\n3. 커리어컨설팅(직무심화 및 직무전환 등 Career Path 컨설팅)\n- 오프라인 미팅 60분 당 20만원\n컨설팅이 시작된 이후 사용자가 컨설팅을 종료하기를 희망하면 50% 환불"),
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
