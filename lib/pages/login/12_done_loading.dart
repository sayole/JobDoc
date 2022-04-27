import 'package:flutter/material.dart';

class DoneLoading extends StatelessWidget {
  const DoneLoading({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Image.asset('assets/done_image.png', width: 300, height: 420),
                  SizedBox(height: 10),
                  Text(
                    "1-2일 내로 컨설턴트가\n제안서를 작성하면 알려드릴게요",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: -0.6,
                        height: 1.6),
                  ),
                ],
              ),
              Positioned(
                bottom: 64,
                left: 16,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    print("프로필 작성하기 클릭 됨");
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromARGB(255, 52, 31, 213),
                        )),
                    child: Text(
                      "둘러보러 가기",
                      style: TextStyle(
                        color: Color.fromARGB(255, 52, 31, 213),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.6,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
