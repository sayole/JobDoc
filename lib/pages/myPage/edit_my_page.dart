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
  List<dynamic> skillSetList = [];

  Widget titleText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }

  void initState() {
    super.initState();
  }

  updateSkillSet() {
    EditProcessService service = context.read<EditProcessService>();
    service.makeTextBox(skillSetList, skillController);
    print(schoolNameController.text);
  }

  deleteSkillSet(String thisText) {
    EditProcessService service = context.read<EditProcessService>();
    service.deleteTextBox(skillSetList, thisText);
  }

//   getUserData(QueryDocumentSnapshot<Object?> doc) {
//     UserData user = UserData();
//     user.uid = doc.get('uid');
//     user.name = doc.get('name');
//     user.educationGroup = doc.get('educationGroup');
//     user.educationSchoolName = doc.get('educationSchoolName');
//     user.educationStatus = doc.get('educationStatus');
//     user.careerCompany = doc.get('careerCompany');
//     user.careerCompany = doc.get('careerCompany');
//     user.careerCompany = doc.get('careerCompany');
//     user.careerYears = doc.get('careerYears');
//     user.careerYears = doc.get('careerYears');
//     user.careerYears = doc.get('careerYears');
//     user.careerPart = doc.get('careerPart');
// careerType
// skillSet
// wishingCompany
// wishingJoinDate
// wishingConsulting
//     name = parsedJson['name'] ?? '';
//     UserService userService = context.read<UserService>();
//     userService.thisUser = user;
//   }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProcessService>(
        builder: (context, editProcessService, child) {
      UserService userService = context.read<UserService>();
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('??? ??????', style: LoginStyles.headline),
          leading: IconButton(
            icon: Image.asset(
              'assets/icons/left_arrow.png',
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            onPressed: () => {Navigator.pop(context)},
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              onPressed: () {},
              child: const Text('????????????'),
            )
          ],
          elevation: 0,
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: userService.getUserData(),
            builder: (context, snapshot) {
              final documents = snapshot.data?.docs ?? [];
              if (documents.isEmpty) {
                return Text('');
              } else {
                final doc = documents[0];
                skillSetList = doc.get('skillSet');
                print(doc.get('skillSet').runtimeType);
                print(doc.id);
                return SafeArea(
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
                          ...SubmitWidgets.infoText("?????????????????? ????????? ????????????\n???????????? ?????????",
                              '???????????? ???????????? ???????????? ???????????? ?????????????????? ???????????? ?????? ??????????????????.'),
                          SizedBox(height: 20),
                          titleText('????????????'),
                          SubmitWidgets.submitDropDownField(
                              '??????', groupcontroller, doc.get('educationGroup')),
                          SubmitWidgets.submitTextField(
                              "?????????",
                              schoolNameController,
                              doc.get('educationSchoolName')),
                          SubmitWidgets.submitDropDownField("?????? ??????",
                              statusController, doc.get('educationStatus')),
                          ////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////
                          SizedBox(height: 20),
                          titleText('???????????? ??????'),
                          SubmitWidgets.submitTextField('??????', companyController,
                              doc.get('careerCompany')),
                          SubmitWidgets.submitDropDownField(
                              '??????', yearsController, doc.get('careerYears')),
                          SubmitWidgets.submitTextField(
                              '??????', partController, doc.get('careerPart')),
                          SubmitWidgets.submitDropDownField(
                              '????????????', typeController, doc.get('careerType')),
                          ////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////
                          SizedBox(height: 20),
                          titleText('?????? ???????????? ?????????'),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ConstrainedBox(
                                          constraints:
                                              BoxConstraints(minWidth: 50),
                                          child: IntrinsicWidth(
                                            child: TextField(
                                              controller: skillController,
                                              style: LoginStyles.inputStyle,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: SubmitWidgets
                                                    .hintValueList['?????????'],
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
                                            editProcessService.makeTextBox(
                                                skillSetList, skillController);
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    ...skillSetList.map((e) =>
                                        SubmitWidgets.textBox(
                                            true, e, deleteSkillSet)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////
                          SizedBox(height: 20),
                          // titleText('???????????? ??????'),
                          // ...SubmitWidgets.companyWidget(
                          //     '?????????',
                          //     internalCompanys1,
                          //     internalCompanys2,
                          //     updateSkillSet),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
      );
    });
  }
}
