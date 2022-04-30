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
  List<String> postList = ['hello'];
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

  void deletePost() {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    print('heere');
    service.deletePost(postList, postController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
        builder: (context, loginProcessService, child) {
      loginProcessService.addControllers([postController]);
      return LoginProcessScaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...SubmitWidgets.infoText('마지막으로 마음 속 담아둔 공고가 있으시다면 알려주세요!',
                  '컨설턴트와 첫 상담 시 참고될 내용이에요. 나중에 컨설턴트에게 직접 알려주셔도 좋아요'),
              SubmitWidgets.submitPostTextField(
                  postList, postController, deletePost),
            ],
          ),
        ),
        nextPage: DoneLoading(),
        index: 7,
      );
    });
  }
}
