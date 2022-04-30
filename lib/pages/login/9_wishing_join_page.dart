import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/10_wishing_consulting_page.dart';

import 'login_process_scaffold.dart';

class WishingJoinPage extends StatefulWidget {
  WishingJoinPage({Key? key}) : super(key: key);

  @override
  State<WishingJoinPage> createState() => _WishingJoinPageState();
}

class _WishingJoinPageState extends State<WishingJoinPage> {
  List<String> joinController = [];

  @override
  Widget build(BuildContext context) {
    return LoginProcessScaffold(
      body: Text('hello'),
      nextPage: WishingConsultingPage(),
      index: 5,
    );
  }
}
