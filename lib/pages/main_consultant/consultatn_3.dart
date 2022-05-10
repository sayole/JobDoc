import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'consultatn_3_profile.dart';

class ConsultantDetail_3 extends StatelessWidget {
  const ConsultantDetail_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var company_list = [
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fhanjun.png?alt=media&token=3b551612-8ef3-4c11-9f3b-3026e28c759f',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fgungang.png?alt=media&token=b9c23002-9f65-4f47-9191-68ca02da7b66',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Flh.jpg?alt=media&token=94f9fd3b-900d-48fd-9259-20ecb061e079',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fmetro.png?alt=media&token=a0b2189f-73c6-4d79-8ee8-2f2d05b07ee7',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/company_logo%2Fhanhwaligo.png?alt=media&token=8a29e815-4baf-4bc4-92c4-02fc18899b4e',
    ];

    var review_list = [
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/review_list%2Fumch10.png?alt=media&token=498fba4f-7ba8-49b5-9d0e-acce1fefda8f',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/review_list%2Fumchi3.jpeg?alt=media&token=f3c3790c-e617-4630-b53a-d4c6c130dd4e',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/review_list%2Fumchi5.jpeg?alt=media&token=864d0e33-cbb8-4f8e-91a9-cf1eab431d1a',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/review_list%2Fumchi2.jpeg?alt=media&token=5c09ea9a-298e-44a0-a8e2-6a835c4806cb',
      'https://firebasestorage.googleapis.com/v0/b/jobdoc-8fbca.appspot.com/o/review_list%2Fumchi1.png?alt=media&token=a1273257-1696-4f01-92e1-f3f11e9cffe9'
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
                      "‘나’에 대한 확실한 이해를 돕겠습니다",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "#논리적 #이성적 #합리적",
                      style: TextStyle(
                          color: Color(0xFFF3936F1),
                          fontSize: 14,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 18),
                    Image.asset("assets/images/person1.png", width: 92),
                    SizedBox(height: 40),
                    Text(
                      "엄취쌤 컨설턴트",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.6,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '"엄마! 나 취업했어!" 라고 외치는 날을 기다리고 있나요?  안녕하세요. "엄취쌤"입니다.    취업의 마지막 관문 면접!  서류 통과 후 힘들게 올라온 면접에는 꼭! 붙어야합니다.  아니,  온/ 오프라인 취업준비생 약 300명 컨설팅 경력의 엄취쌤이 붙게 만들어드립니다!    대기업 면접! 공기업 면접! 공무원 면접! 중견기업 면접! 중소기업 면접!  면접은 면접관에게 "나"를 실제로 보여주는 과정입니다.  어떻게 대답해야 하고, 어떻게 연습해야 하는지  엄취쌤이 확실하게 알려 드립니다~!',
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
                      //삼
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
                    Text("*면접 컨설팅 진행 방법"),
                    Text("1) 컨설팅 전, 엄취쌤이 해당 기업 면저 빈출 문제를 제공합니다."),
                    Text(
                        "2) 취준생은 면접 빈출 문제 답변을 준비하고 궁금한 부분이 있으면 업취쌤에게 피드백을 요청합니다. "),
                    Text("3) 엄취쌤은 무한으로 피드백을 드립니다."),
                    Text(
                        "4) 컨설팅 시,모의면접을 진행하며 자세, 발성, 발음 등을 진단하고 답변 방법에 대한 피드백을 진행합니다.\n"),
                    Text(
                        "※ 인성면접 뿐 아니라 PT면접, 토론면접까지 현재 필요한 유형의 면접을 확실하게 알려드립니다!"),
                    Text(""),
                    Text(
                        "[전문가 소개]\n*크몽 '취얼업 취패소생술 특강' 및 다수 강연 진\n현) 컨설팅 기업(SC컨설턴트) 운영\n현) 취업준비생 온,오프라인 컨설턴트\n전) 아성다이소 영업관리 근무\n전) 한샘 TR(Territory Representative) 근무\n전) 남양유업 영업관리 근\n전) 한국야쿠르트 명업관리 근무\n전) 한화호텔앤리조트 마케팅팀 근무\n전) 이디야 커피 영업관리 근무"),
                    Text(""),
                    Text(
                        "*STANDARD :전화 면접 코칭 1회 (90분)\n- 1분 자기소개 , 성격의 장단점, 직무와 관련된 역량 등 빈도수 높은 질문 코칭\n- 해당 기업 분석 이후, 기업 기출 질문 코칭"),
                    Text(""),
                    Text(
                        "*DELUXE : 대면 면접 코칭 1회 (3시간)\n- 1분 자기소개 , 성격의 장단점, 직무와 관련된 역량 등 빈도수 높은 질문 코칭\n- 해당 기업 분석 이후, 기업 기출 질문 코칭\n- 자세, 발성, 발음 등의 비언어적 부분 코칭"),
                    Text(""),
                    Text(
                        "* PREMIUM : 대면 면접 코칭 2회 (3시간 × 2회)\n- 면접에 전혀 경혐이 없거나, 완벽하게 대비하고 싶은 취준생을 위한 맞춤 코칭\n-1분 자기소개 , 성격의 장단점, 직무와 관련된 역량 등 빈도수가 높은 질문 코칭\n- 기업, 직무별 면접 대비 전략을 잡아가는 코칭\n- 자세, 발성, 발음 등의 비언어적 부분 코칭"),
                    Text(""),
                    Text("[장소]\n*대면 컨설팅 시\n- 서울 종로 스터디룸에서 진행"),

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
                      //삼
                      height: 200,
                      child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: review_list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                review_list[index],
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
                MaterialPageRoute(builder: (context) => ContactInfo3()),
              );
            },
          ),
        ],
      ),
    );
  }
}
