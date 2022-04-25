import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/11_job_posting_page.dart';

import 'login_process_scaffold.dart';

class WishingConsultingPage extends StatefulWidget {
  WishingConsultingPage({Key? key}) : super(key: key);

  @override
  State<WishingConsultingPage> createState() => _WishingConsultingPageState();
}

class _WishingConsultingPageState extends State<WishingConsultingPage> {
  @override
  Widget build(BuildContext context) {
    return LoginProcessScaffold(
        body: Text('hello'), nextPage: JobPostingPage(), index: 6);
  }
}
