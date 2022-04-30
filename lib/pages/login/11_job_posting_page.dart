import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/12_done_loading.dart';
import 'package:job_doc/pages/login/widgets/submit_widgets.dart';
import 'package:provider/provider.dart';

import '../../services/login_process_service.dart';
import 'login_process_scaffold.dart';

class JobPostingPage extends StatefulWidget {
  JobPostingPage({Key? key}) : super(key: key);

  @override
  State<JobPostingPage> createState() => _JobPostingPageState();
}

class _JobPostingPageState extends State<JobPostingPage> {
  // List<String> postController = [];
  TextEditingController postController = TextEditingController();

  void checkProcessDone() {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    service.checkProcessDone();
  }

  @override
  void initState() {
    super.initState();
    postController.addListener(checkProcessDone);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
        builder: (context, loginProcessService, child) {
      loginProcessService.addControllers([postController]);
      return LoginProcessScaffold(
        body: SubmitWidgets.submitPostTextField(postController),
        nextPage: DoneLoading(),
        index: 7,
      );
    });
  }
}
