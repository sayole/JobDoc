import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/4_education_page.dart';
import 'package:job_doc/pages/login/login_process_scaffold.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginProcessScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            children: [
              TextSpan(text: "간단한 질문에 답해주시면\n"),
              TextSpan(text: "저희가 프로필을 만들어서\n"),
              TextSpan(text: "컨설턴트에게 제안서를 보내드릴게요\n"),
            ],
          ),
        ),
      ),
      nextPage: EducationPage(),
      index: 0,
    );
  }
}
