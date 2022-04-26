import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/12_done_loading.dart';

import 'login_process_scaffold.dart';

class JobPostingPage extends StatefulWidget {
  JobPostingPage({Key? key}) : super(key: key);

  @override
  State<JobPostingPage> createState() => _JobPostingPageState();
}

class _JobPostingPageState extends State<JobPostingPage> {
  List<String> postController = [];

  @override
  Widget build(BuildContext context) {
    return LoginProcessScaffold(
      body: Text('hello'),
      nextPage: DoneLoading(),
      index: 7,
    );
  }
}
