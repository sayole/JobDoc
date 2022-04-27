import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/8_wishing_company_page.dart';
import 'package:provider/provider.dart';

import '../../services/login_process_service.dart';
import 'login_process_scaffold.dart';
import 'widgets/submit_widgets.dart';

class SkillSetPage extends StatefulWidget {
  SkillSetPage({Key? key}) : super(key: key);

  @override
  State<SkillSetPage> createState() => _SkillSetPageState();
}

class _SkillSetPageState extends State<SkillSetPage> {
  List<String> skillController = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
        builder: (context, loginProcessService, child) {
      loginProcessService.addControllers([skillController]);
      return LoginProcessScaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...SubmitWidgets.infoText('가장 자신있는 스킬셋을 입력해주세요',
                      '가장 자신있는 스킬셋을 자유롭게 입력해주세요. 자세하게 써주실수록 관련있는 컨설턴트와 매칭될 확률이 높아져요.'),
                  SubmitWidgets.textBox('grey', '작성하여 추가하기')
                ])),
        nextPage: WishingCompanyPage(),
        index: 3,
      );
    });
  }
}
