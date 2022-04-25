import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/7_skill_set_page.dart';
import 'package:job_doc/pages/login/login_process_scaffold.dart';

class CareerPage extends StatefulWidget {
  CareerPage({Key? key}) : super(key: key);

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  @override
  Widget build(BuildContext context) {
    return LoginProcessScaffold(
        body: Text('hello'), nextPage: SkillSetPage(), index: 2);
  }
}
