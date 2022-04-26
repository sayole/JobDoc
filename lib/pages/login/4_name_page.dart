import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/5_education_page.dart';
import 'package:job_doc/pages/login/login_process_scaffold.dart';
import 'package:job_doc/pages/login/widgets/login_styles.dart';
import 'package:job_doc/pages/login/widgets/submit_widgets.dart';
import 'package:provider/provider.dart';

import '../../services/login_process_service.dart';

class NamePage extends StatefulWidget {
  NamePage({Key? key}) : super(key: key);

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  TextEditingController nameController = TextEditingController();

  void checkProcessDone() {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    service.checkProcessDone();
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(checkProcessDone);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
        builder: (context, loginProcessService, child) {
      loginProcessService.addControllers([nameController]);
      return LoginProcessScaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...SubmitWidgets.infoText('이름을 입력해 주세요',
                  '이름은 오직 컨설턴트와 이야기할 때 본인인지 확인하는 용도로 만 사용돼요. 주민등록상 본명을 입력해주세요'),
              SubmitWidgets.submitTextField("이름을 입력해주세요", nameController)
            ],
          ),
        ),
        nextPage: EducationPage(),
        index: 0,
      );
    });
  }
}
