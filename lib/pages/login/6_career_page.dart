import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/7_skill_set_page.dart';
import 'package:job_doc/pages/login/login_process_scaffold.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';
import '../../services/login_process_service.dart';
import 'widgets/submit_widgets.dart';

class CareerPage extends StatefulWidget {
  CareerPage({Key? key}) : super(key: key);

  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  TextEditingController companyController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController partController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  void checkProcessDone() {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    UserService userService = context.read<UserService>();
    userService.thisUser.careerCompany = companyController.text;
    userService.thisUser.careerYears = yearsController.text;
    userService.thisUser.careerPart = partController.text;
    userService.thisUser.careerType = typeController.text;

    service.checkProcessDone();
  }

  @override
  void initState() {
    super.initState();
    companyController.addListener(checkProcessDone);
    yearsController.addListener(checkProcessDone);
    partController.addListener(checkProcessDone);
    typeController.addListener(checkProcessDone);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
        builder: (context, loginProcessService, child) {
      loginProcessService.addControllers(
          [companyController, yearsController, partController, typeController]);
      return LoginProcessScaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...SubmitWidgets.infoText(
                      '????????? ?????? ?????? ?????? ?????????????', '?????? ?????? ???????????? ?????? ?????? ?????? ????????? ???????????????.'),
                  SubmitWidgets.submitTextField(
                      '??????', companyController, 'none'),
                  SubmitWidgets.submitDropDownField(
                      '??????', yearsController, 'none'),
                  SubmitWidgets.submitTextField('??????', partController, 'none'),
                  SubmitWidgets.submitDropDownField(
                      '????????????', typeController, 'none'),
                ])),
        nextPage: SkillSetPage(),
        index: 2,
      );
    });
  }
}
