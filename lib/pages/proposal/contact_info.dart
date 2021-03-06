import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "컨설턴트 닉네임",
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
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      "qusdlsk",
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
                      "010-9912-3741",
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
                      "dsdfkdj@gmail.com",
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
                      "링크",
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
      ),
    );
  }
}
