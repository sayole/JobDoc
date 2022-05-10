import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_doc/pages/proposal/contact_info.dart';

class ConsultantDetail extends StatelessWidget {
  late String doc_id;

  ConsultantDetail({
    required this.doc_id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/icons/left_arrow.png",
            width: 28,
          ),
        ),
        title: Text(
          "견적 상세 내용",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/icons/close.png",
              width: 28,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: StreamBuilder<DocumentSnapshot<Object?>>(
          stream: FirebaseFirestore.instance
              .collection('proposal_list')
              .doc(doc_id)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              dynamic data = snapshot.data!.data();

              return DetailContent(
                amount: data["amount"],
                company_list: data["company_list"],
                consultant_id: data["consultant_id"],
                consultant_image: data["consultant_image"],
                date: data["date"],
                expected_amount: data["expected_amount"],
                final_amount: data["final_amount"],
                monthly_amount: data["monthly_amount"],
                reviews: data["reviews"],
                service: data["service"],
                tag: data["tag"],
                text: data["text"],
                title: data["title"],
                user_id: data["user_id"],
                consultant_nickname: data["consultant_nickname"],
                doc_id: doc_id,
              );
            }
          }),
    );
  }
}

class DetailContent extends StatelessWidget {
  late String amount;
  late List company_list;
  late String consultant_id;
  late String consultant_image;
  late String date;
  late String expected_amount;
  late String final_amount;
  late String monthly_amount;
  late List reviews;
  late String service;
  late String tag;
  late String text;
  late String title;
  late String user_id;
  late String consultant_nickname;
  late String doc_id;

  DetailContent({
    required this.amount,
    required this.company_list,
    required this.consultant_id,
    required this.consultant_image,
    required this.date,
    required this.expected_amount,
    required this.final_amount,
    required this.monthly_amount,
    required this.reviews,
    required this.service,
    required this.tag,
    required this.text,
    required this.title,
    required this.user_id,
    required this.consultant_nickname,
    required this.doc_id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    date,
                    style: TextStyle(
                      color: Color(0xFFF3D3D3D),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    tag,
                    style: TextStyle(
                        color: Color(0xFFF3936F1),
                        fontSize: 14,
                        letterSpacing: -0.6,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 18),
                  Image.asset("assets/images/${consultant_image}.png",
                      width: 92),
                  SizedBox(height: 40),
                  Text(
                    consultant_nickname,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    text,
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
                            child: Image.network(company_list[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  // 여기에 이미지를 넣어야함.ㅇㅇ
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
                  Text(service),
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
                      itemCount: reviews.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (_) => ImageDialog(
                                ImgUrl: reviews[index],
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.network(reviews[index]),
                            margin: EdgeInsets.only(right: 8),
                          ),
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
                      color: Color(0xFFF3D3D3D),
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
                        monthly_amount,
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
                        expected_amount,
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
                        final_amount,
                        style: TextStyle(
                          color: Color(0xFFF3936F1),
                          fontSize: 16,
                          letterSpacing: -0.6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (contect) => ContactInfo(
                          doc_id: doc_id,
                        )));
          },
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
        ),
      ],
    );
  }
}

class ImageDialog extends StatelessWidget {
  late String ImgUrl;

  ImageDialog({required this.ImgUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(ImgUrl), fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
