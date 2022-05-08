import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/pages/proposal/consultant_detail.dart';

class ContactInfo extends StatelessWidget {
  late String doc_id;

  ContactInfo({
    required this.doc_id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
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
          "컨설턴트 정보",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/icons/close.png"),
              color: Color(0xFFF000000),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
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

              return Content(
                tag: data["tag"],
                title: data["title"],
                kakao: data["kakao"],
                phone: data["phone"],
                email: data["email"],
                etc: data["etc"],
                consultant_nickname: data["consultant_nickname"],
              );
            }
          }),
    );
  }
}

class Content extends StatelessWidget {
  late String tag;
  late String title;
  late String kakao;
  late String phone;
  late String email;
  late String etc;
  late String consultant_nickname;

  Content({
    required this.tag,
    required this.title,
    required this.kakao,
    required this.phone,
    required this.email,
    required this.etc,
    required this.consultant_nickname,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: 48),
              Row(
                children: [
                  Container(
                    width: 101,
                    child: Text(
                      "카카오톡",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: -0.6,
                        color: Color(0xFFF3D3D3D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    kakao,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: -0.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 101,
                    child: Text(
                      "전화번호",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: -0.6,
                        color: Color(0xFFF3D3D3D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    phone,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: -0.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 101,
                    child: Text(
                      "이메일",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: -0.6,
                        color: Color(0xFFF3D3D3D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: -0.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 101,
                    child: Text(
                      "기타",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: -0.6,
                        color: Color(0xFFF3D3D3D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    etc,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: -0.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color(0xFFFDFDFDF),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage("assets/icons/light_bulb_filament.png"),
                          color: Color(0xFFF3936F1),
                        ),
                        Text(
                          "Tip!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFF3936F1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: 252,
                      child: Text(
                        "‘잡닥’ 통해서 연락드린다고 말씀드리면 컨설턴트분들께서 바로 안내를 도와드려요.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.6,
                          height: 1.6,
                          color: Color(0xFFF3936F1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
