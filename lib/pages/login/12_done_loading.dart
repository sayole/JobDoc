import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/pages/main_home/main_home.dart';
import 'package:job_doc/pages/main_home/main_home_type1.dart';
import 'package:job_doc/pages/myPage/edit_my_page.dart';
import 'package:job_doc/pages/myPage/my_page.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';

class DoneLoading extends StatelessWidget {
  const DoneLoading({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Consumer<UserService>(builder: (context, userService, child) {
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
                    Expanded(
                      flex: 4,
                      child: Image.asset('assets/images/done_image.png',
                          width: 300, height: 420),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "1-2일 내로 컨설턴트가\n제안서를 작성하면 알려드릴게요",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            letterSpacing: -0.6,
                            height: 1.6),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 64,
                  left: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () async {
                      FirebaseMessaging messaging = FirebaseMessaging.instance;
                      userService.thisUser.token = await messaging.getToken();
                      userService.createUser();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      userService.getUserData();
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
    });
  }
}
