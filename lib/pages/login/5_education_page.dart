import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/6_career_page.dart';
import 'package:provider/provider.dart';

import '../../services/login_process_service.dart';
import 'login_process_scaffold.dart';
import 'widgets/submit_widgets.dart';

class EducationPage extends StatefulWidget {
  EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  TextEditingController groupcontroller = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  void checkProcessDone() {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    service.checkProcessDone();
  }

  @override
  void initState() {
    super.initState();
    groupcontroller.addListener(checkProcessDone);
    schoolNameController.addListener(checkProcessDone);
    statusController.addListener(checkProcessDone);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
      builder: (context, loginProcessService, child) {
        loginProcessService.addControllers(
            [groupcontroller, schoolNameController, statusController]);
        return LoginProcessScaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...SubmitWidgets.infoText(
                    '최종 학력을 입력해주세요', '작성하는 지금 이 순간 현재 학력이 무엇인지 입력해주세요.'),
                SubmitWidgets.submitTextField(
                    "학교 이름을 작성해주세요", schoolNameController),
                SubmitWidgets.submitTextField("학력", schoolNameController),
                SubmitWidgets.submitTextField("재학", schoolNameController),
              ],
            ),
          ),
          nextPage: CareerPage(),
          index: 1,
        );
      },
    );
  }
}
