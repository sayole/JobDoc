import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/8_wishing_company_page.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';

import '../../services/login_process_service.dart';
import 'login_process_scaffold.dart';
import 'widgets/login_styles.dart';
import 'widgets/submit_widgets.dart';

class SkillSetPage extends StatefulWidget {
  SkillSetPage({Key? key}) : super(key: key);

  @override
  State<SkillSetPage> createState() => _SkillSetPageState();
}

class _SkillSetPageState extends State<SkillSetPage> {
  TextEditingController skillController = TextEditingController();
  List<String> skillSetList = [];

  updateData() {
    UserService userService = context.read<UserService>();
    userService.thisUser.skillSet = skillSetList;
  }

  void checkProcessDone() {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    UserService userService = context.read<UserService>();
    userService.thisUser.skillSet = skillSetList;
  }

  deleteSkillSet(String thisText) {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    service.deleteTextBox(skillSetList, thisText);
    updateData();
  }

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
                  // SubmitWidgets.skillSetWidget(skillSetList, skillController),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicWidth(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xffdfdfdf)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: 50),
                                  child: IntrinsicWidth(
                                    child: TextField(
                                      controller: skillController,
                                      style: LoginStyles.inputStyle,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            SubmitWidgets.hintValueList['스킬셋'],
                                        hintStyle: TextStyle(
                                          color: Color(0xff3d3d3d),
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.6,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    loginProcessService.makeTextBox(
                                        skillSetList,
                                        updateData,
                                        skillController);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xff3d3d3d),
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ...skillSetList.map((e) =>
                            SubmitWidgets.textBox(true, e, deleteSkillSet))
                      ],
                    ),
                  ),
                ])),
        nextPage: WishingCompanyPage(),
        index: 3,
      );
    });
  }
}
