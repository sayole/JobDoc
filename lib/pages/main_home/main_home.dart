import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_doc/models/user_data.dart';
import 'main_home_type2.dart';
import 'main_home_type3.dart';
import 'main_home_type4.dart';
import 'package:job_doc/pages/settings.dart';

import 'main_home_type1.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserData user = UserData();

  FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn();

  int currentIndex = 0; // 처음에 나올 화면 지정
  List<String> pageNameList = ['홈', '나의 견적', '내정보', '환경 설정'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          MainPage(), // tpye1
          Text('2'), // 프로포절 페이지
          Text('3'), // 내정보 페이지
          SettingPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedItemColor: Color(0xFFF3936F1),
        unselectedItemColor: Colors.grey,
        onTap: (int newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/icons/home_chosen.png'),
              ),
              label: '홈'),
          BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage('assets/icons/proposal_not_chosen.png')),
              label: '나의 견적'),
          BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage('assets/icons/my_page_not_chosen.png')),
              label: '내정보'),
          BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage('assets/icons/setting_not_chosen.png')),
              label: '환경 설정'),
        ],
      ),
    );
  }
}
