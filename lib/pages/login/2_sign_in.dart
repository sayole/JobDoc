//회원가입 페이지
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/3_privacy_policy.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TapGestureRecognizer privacyLinkRecognizer = TapGestureRecognizer();
  TapGestureRecognizer usageLinkRecognizer = TapGestureRecognizer();

  void NextPage() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => PrivacyPolicy()),
    // );
    print('next');
  }

  Widget LoginButton(String type) {
    String logo = '';
    String text = '로 계속하기';
    switch (type) {
      case 'google':
        logo = 'assets/icons/google_logo.png';
        text = '구글' + text;
        break;
      case 'facebook':
        logo = 'assets/icons/facebook_logo.png';
        text = '페이스북으' + text;
        break;
      case 'apple':
        logo = 'assets/icons/apple_logo.png';
        text = 'Apple' + text;
        break;
    }

    return Column(
      children: [
        Container(
          decoration: type == 'facebook'
              ? BoxDecoration(
                  color: Color(0xFF1877f2),
                  border: Border.all(
                    color: Color(0xFF1877f2),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                )
              : BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
              // horizontal: 24,
              // vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(logo),
                SizedBox(
                  width: 56,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: type == 'facebook' ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            "빠르게 이직 컨설팅 받고",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "퀀텀 점프하기",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/sign_in_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {print('google'), NextPage()},
                      child: LoginButton('google'),
                    ),
                    GestureDetector(
                      onTap: () => {print('apple'), NextPage()},
                      child: LoginButton('apple'),
                    ),
                    GestureDetector(
                      onTap: () => {print('facebook'), NextPage()},
                      child: LoginButton('facebook'),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(text: "회원가입 시 "),
                          TextSpan(
                            text: '개인정보 처리 방침',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                            recognizer: privacyLinkRecognizer
                              ..onTap = () => {print('privacy')},
                          ),
                          TextSpan(text: '을 읽었으며,\n  '),
                          TextSpan(
                            text: '이용약관',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                            recognizer: usageLinkRecognizer
                              ..onTap = () => {print('usage')},
                          ),
                          TextSpan(text: "에 동의하신 것으로 간주합니다."),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
