import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/8_wishing_company_page.dart';

import 'login_process_scaffold.dart';

class SkillSetPage extends StatefulWidget {
  SkillSetPage({Key? key}) : super(key: key);

  @override
  State<SkillSetPage> createState() => _SkillSetPageState();
}

class _SkillSetPageState extends State<SkillSetPage> {
  @override
  Widget build(BuildContext context) {
    return LoginProcessScaffold(
        body: Text('hello'), nextPage: WishingCompanyPage(), index: 3);
  }
}
