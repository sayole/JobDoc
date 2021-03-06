import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../myPage/my_page.dart';
import 'main_home_type1.dart';
import 'settings_withdraw.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _toggled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "환경 설정",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.6,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                '마이페이지',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.6,
                    fontFamily: 'Pretendard'),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  '프로필 수정하기',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                      fontFamily: 'Pretendard'),
                ),
                trailing: Image(
                  image: AssetImage('assets/icons/right_arrow.png'),
                  width: 20,
                  height: 20,
                ),
                onTap: () {
                  print("감사합니다 수정하시오");
                },
              ),
              SizedBox(height: 40),
              Text(
                '내 계정 관리',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.6,
                    fontFamily: 'Pretendard'),
              ),
              //알림
              SwitchListTile(
                activeColor: Color(0xFFF3936F1),
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  '알림을 받을게요',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                      fontFamily: 'Pretendard'),
                ),
                value: _toggled,
                onChanged: (bool value) {
                  setState(() => _toggled = value);
                },
              ),
              //앱 공유
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  '친구에게 앱을 공유해줄게요',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                      fontFamily: 'Pretendard'),
                ),
                trailing: Text(
                  "공유하기",
                  style: TextStyle(
                      color: Color(0xFFF3936F1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.6,
                      fontFamily: 'Pretendard'),
                ),
                onTap: () {
                  Share.share(
                      Platform.environment == Platform.isAndroid
                          ? 'https://www.naver.com/' // 플레이스토어 앱 링크
                          : 'https://www.google.com/', // 앱스토어 링크
                      subject: '잡닥, 커리어 매칭 플랫폼');
                },
              ),
              // 로그아웃
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  '로그아웃',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                      fontFamily: 'Pretendard'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => withDraw()),
                  );
                },
              ),
              //회원 탈퇴
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  '회원 탈퇴',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                      fontFamily: 'Pretendard'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => withDraw()),
                  );
                },
              ),
              SizedBox(height: 40),
              Text(
                '고객 지원',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.6,
                    fontFamily: 'Pretendard'),
              ),
              // 버전
              SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  '앱 버전 정보',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                      fontFamily: 'Pretendard'),
                ),
                trailing: Text("1.0.0"),
              ),
              //문의하기
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minVerticalPadding: -5,
                title: Text(
                  '문의하기',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                      fontFamily: 'Pretendard'),
                ),
                trailing: Image(
                  image: AssetImage('assets/icons/right_arrow.png'),
                  width: 20,
                  height: 20,
                ),
                onTap: () {
                  launch("http://pf.kakao.com/_YxmxgUb/chat");
                },
              ),
              //이용 약관
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  '이용 약관',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                      fontFamily: 'Pretendard'),
                ),
                trailing: Image(
                  image: AssetImage('assets/icons/right_arrow.png'),
                  width: 20,
                  height: 20,
                ),
                onTap: () {
                  launch(
                      "https://hampaper.notion.site/e92066c2ea8e4cc48231e8d5ee10db98");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
