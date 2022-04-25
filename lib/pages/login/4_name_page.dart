import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/5_education_page.dart';
import 'package:job_doc/pages/login/login_process_scaffold.dart';

class NamePage extends StatefulWidget {
  NamePage({Key? key}) : super(key: key);

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  @override
  Widget build(BuildContext context) {
    return LoginProcessScaffold(
        body: Text('hello'), nextPage: EducationPage(), index: 0);
  }
}
