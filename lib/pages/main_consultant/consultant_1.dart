import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'consultant_1_profile.dart';

class ConsultantDetail_1 extends StatelessWidget {
  const ConsultantDetail_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var company_list = [
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fsamsung_bio.png?alt=media&token=d0c78ddc-4571-4280-a84a-d117ef4b3a88',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Flh.jpg?alt=media&token=94f9fd3b-900d-48fd-9259-20ecb061e079',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fpulmuone.jpg?alt=media&token=73559962-4320-4cf4-9798-c1cb4e326220',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fseoul_univ.jpg?alt=media&token=1dd035ed-fbbd-479d-b3d1-8d9d1477cde4',
    ];

    var reveiw_list = [
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/review_list%2Flh%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%90%E1%85%A5%E1%86%AB%20%E1%84%92%E1%85%A1%E1%86%B8%E1%84%80%E1%85%A7%E1%86%A8.png?alt=media&token=f8ac5c0a-9584-44cc-8071-ddaf4f683c43',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/review_list%2F%E1%84%80%E1%85%AE%E1%84%80%E1%85%AF%E1%86%AB%E1%84%86%E1%85%A9%20%E1%84%92%E1%85%A1%E1%86%B8%E1%84%80%E1%85%A7%E1%86%A8.png?alt=media&token=ca08bb61-2c2c-4346-872d-87dab50959cb',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/review_list%2F%E1%84%89%E1%85%A1%E1%86%B7%E1%84%89%E1%85%A5%E1%86%BC%E1%84%87%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%A9%E1%84%85%E1%85%A9%E1%84%8C%E1%85%B5%E1%86%A8%E1%84%89%E1%85%B3%E1%84%92%E1%85%A1%E1%86%B8%E1%84%80%E1%85%A7%E1%86%A8.png?alt=media&token=7349ca9b-1ac9-4412-b9dc-ff561bfd18f4',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/review_list%2F%E1%84%89%E1%85%A1%E1%86%B7%E1%84%89%E1%85%A5%E1%86%BC%E1%84%87%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%A9%E1%84%85%E1%85%A9%E1%84%8C%E1%85%B5%E1%86%A8%E1%84%89%E1%85%B3%E1%84%92%E1%85%A1%E1%86%B8%E1%84%80%E1%85%A7%E1%86%A8.png?alt=media&token=7349ca9b-1ac9-4412-b9dc-ff561bfd18f4'
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
                      "당신이 원하는 완벽한 직업을 위한 최고의 파트너",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "#인사담당자98%만족도 #자소서코칭 #면접코칭 #이직컨설팅",
                      style: TextStyle(
                          color: Color(0xFFF3936F1),
                          fontSize: 14,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 18),
                    Image.asset("assets/images/person3.png", width: 92),
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
                        "임희정 컨설턴트 코치\n\*\*\* 면접관을 사로잡는 1:1 취업 이직 컨설팅코칭 \*\*\*\n (자소서 작성, 수정, 진단 및 첨삭,면접)\n  \*오프라인        100분 진행 20만원 \/추가 60분 5만원\n  \*온라인 zoom 100분 진행 15만원 \/추가 60분 3만원\n \n클래스 진행 방법: \n1)자기소개서 첨삭 및 완성     \n2)면접 코칭. 모의면접   \n3)커리어 코칭. 직무 진단 강점 정리        \n4)포트폴리오 첨삭및 피드백\n\n이런분들께 좋아요: \n1) 대기업. 외국계.공공기관 취업 희망하는 신입 취업, 재취업 준비생                \n2) 경력직 이직을 원하는 분        \n3) 커리어 코칭을 통해 진로적성을 설계 하고 싶은 분  \n4) 기타 취업, 커리어 진로 관련 고민이 있는 분\n\n "),
                    Text(
                        '전문 커리어 코치가 함께 합니다. \n기업에 합격하는 자소서를 쓰고 싶으신가요? \n합격의 길을 찾도록 도움을 주는 전문 커리어 코치와 함께 출발해 보세요. \n\n코칭을 통해 자신 내면의 찾지 못한 강점과 잠재력을 찾아 특별한 자신을 어필 하는 자소서가 만들어 집니다. \n개인별,조직별 정확한 분석과 코칭기법을 여러분의 최종합격을 돕겠습니다. '),
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
                      //삼성전자. 삼성바이오로직스, LH공사. 풀무원. 서울대학병원.
                      height: 200,
                      child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: reveiw_list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                reveiw_list[index],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
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
                MaterialPageRoute(builder: (context) => ContactInfo1()),
              );
            },
          ),
        ],
      ),
    );
  }
}
