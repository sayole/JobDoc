import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/models/user_data.dart';
import 'package:job_doc/pages/login/4_name_page.dart';
import 'package:job_doc/pages/login/5_education_page.dart';
import 'package:job_doc/pages/login/7_skill_set_page.dart';
import 'package:job_doc/pages/login/8_wishing_company_page.dart';
import 'package:job_doc/pages/login/widgets/login_styles.dart';
import 'package:job_doc/pages/login/widgets/submit_widgets.dart';
import 'package:job_doc/services/edit_process_service.dart';
import 'package:job_doc/services/login_process_service.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';

class EditMyPage extends StatefulWidget {
  const EditMyPage({Key? key}) : super(key: key);

  @override
  State<EditMyPage> createState() => _EditMyPageState();
}

class _EditMyPageState extends State<EditMyPage> {
  TextEditingController groupcontroller = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController partController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController skillController = TextEditingController();

  Widget titleText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }

  void initState() {
    UserService userService = context.read<UserService>();

    super.initState();
    // skillSetList = userService.thisUser.wishingCompany;
    // skillSetList = userService.thisUser.wishingJoinDate;
    // skillSetList = userService.thisUser.wishingConsulting;
  }

  updateUserData() {
    UserService userService = context.read<UserService>();
    userService.updateUser();
  }

  createListItem() {
    UserService userService = context.read<UserService>();

    EditProcessService service = context.read<EditProcessService>();
    service.makeTextBox(userService.thisUser.skillSet, skillController);
  }

  deleteListItem(String thisText) {
    UserService userService = context.read<UserService>();

    EditProcessService service = context.read<EditProcessService>();
    service.deleteTextBox(userService.thisUser.skillSet, 'skillSet', thisText);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProcessService>(
        builder: (context, editProcessService, child) {
      UserService userService = context.read<UserService>();
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('내 정보', style: LoginStyles.headline),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              onPressed: () {
                updateUserData();
              },
              child: const Text('저장하기'),
            )
          ],
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...SubmitWidgets.infoText("컨설턴트에게 보내는 제안서를\n수정하고 있어요",
                      '프로필을 수정하고 저장하면 자동으로 컨설턴트에게 제안서를 다시 보내드릴게요.'),
                  SizedBox(height: 20),
                  titleText('최종학력'),
                  SubmitWidgets.submitDropDownField('학력', groupcontroller,
                      userService.thisUser.educationGroup),
                  SubmitWidgets.submitTextField("학교명", schoolNameController,
                      userService.thisUser.educationSchoolName),
                  SubmitWidgets.submitDropDownField("재학 상태", statusController,
                      userService.thisUser.educationStatus),
                  ////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////
                  SizedBox(height: 20),
                  titleText('재직중인 회사'),
                  SubmitWidgets.submitTextField('회사', companyController,
                      userService.thisUser.careerCompany),
                  SubmitWidgets.submitDropDownField(
                      '년차', yearsController, userService.thisUser.careerYears),
                  SubmitWidgets.submitTextField(
                      '직무', partController, userService.thisUser.careerPart),
                  SubmitWidgets.submitDropDownField(
                      '고용형태', typeController, userService.thisUser.careerType),
                  ////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////
                  SizedBox(height: 20),
                  titleText('가장 자신있는 스킬셋'),
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
                                    setState(() {
                                      createListItem();
                                      skillController.text = '';
                                    });
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            ...userService.thisUser.skillSet.map((e) =>
                                SubmitWidgets.textBox(true, e, deleteListItem)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////
                  SizedBox(height: 20),
                  // titleText('목표하는 회사'),
                  // ...SubmitWidgets.companyWidget(
                  //     '대기업',
                  //     internalCompanys1,
                  //     internalCompanys2,
                  //     updateSkillSet),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
