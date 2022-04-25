import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/6_career_page.dart';

import 'login_process_scaffold.dart';

class EducationPage extends StatefulWidget {
  EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  TextEditingController emaincontroller = TextEditingController();
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
              TextSpan(text: "aaaaaaaaaaaa\n"),
              TextSpan(text: "aaaaaaaaaaaaaaaaa\n"),
              TextSpan(text: "aaaaaaaaaaaaaaaaaaaa\n"),
            ],
          ),
        ),
      ),
      nextPage: CareerPage(),
      index: 1,
    );
  }
}
