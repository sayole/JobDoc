import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/9_wishing_join_page.dart';

import 'login_process_scaffold.dart';

class WishingCompanyPage extends StatefulWidget {
  WishingCompanyPage({Key? key}) : super(key: key);

  @override
  State<WishingCompanyPage> createState() => _WishingCompanyPageState();
}

class _WishingCompanyPageState extends State<WishingCompanyPage> {
  List<String> companyController = [];

  @override
  Widget build(BuildContext context) {
    return LoginProcessScaffold(
      body: Text('hello'),
      nextPage: WishingJoinPage(),
      index: 4,
    );
  }
}
