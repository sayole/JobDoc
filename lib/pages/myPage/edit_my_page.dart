import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/models/user_data.dart';
import 'package:job_doc/pages/login/10_wishing_consulting_page.dart';
import 'package:job_doc/pages/login/4_name_page.dart';
import 'package:job_doc/pages/login/5_education_page.dart';
import 'package:job_doc/pages/login/7_skill_set_page.dart';
import 'package:job_doc/pages/login/8_wishing_company_page.dart';
import 'package:job_doc/pages/login/9_wishing_join_page.dart';
import 'package:job_doc/pages/login/widgets/login_styles.dart';
import 'package:job_doc/pages/myPage/submit_widgets.dart';
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
  String id = '';
  TextEditingController groupcontroller = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController partController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  List<String> skillList = [];
  List<String> companys = [];
  List<String> joinList = [];
  List<String> consultingList = [];

  Widget titleText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }

  void initState() {
    super.initState();
    for (var a in internalCompanys1) {
      a['selected'] = false;
    }
    for (var a in internalCompanys2) {
      a['selected'] = false;
    }
    for (var a in foreignCompanys1) {
      a['selected'] = false;
    }
    for (var a in foreignCompanys2) {
      a['selected'] = false;
    }
    for (var a in unicornCompanys1) {
      a['selected'] = false;
    }

    for (var a in unicornCompanys2) {
      a['selected'] = false;
    }
  }

  modifyJoinList(String name, int index, List<String> targetList,
      List<Map<String, dynamic>> thisValueList) {
    EditProcessService service = context.read<EditProcessService>();
    thisValueList[index]['selected'] = !thisValueList[index]['selected'];
    if (thisValueList[index]['selected'] == true) {
      targetList.add(thisValueList[index]['name']);
      service.updateTextBox(targetList);
    } else {
      targetList.remove(thisValueList[index]['name']);
      service.deleteTextBox(id, targetList, name, thisValueList[index]['name']);
    }
    service.updateListItem(id, targetList, name);
  }

  // updateEdited() {
  //   UserService service = context.read<UserService>();
  //   UserData userData = UserData();
  //   userData.educationGroup = groupcontroller.text;
  //   userData.educationSchoolName = schoolNameController.text;
  //   userData.educationStatus = statusController.text;
  //   userData.careerCompany = companyController.text;
  //   userData.careerYears = yearsController.text;
  //   userData.careerPart = partController.text;
  //   userData.careerType = typeController.text;
  //   userData.wishingCompany = companys;
  //   service.update(id, userData);
  // }

  updateEdited() {
    EditProcessService service = context.read<EditProcessService>();
    service.updateTextItem(id, groupcontroller.text, 'educationGroup');
    service.updateTextItem(
        id, schoolNameController.text, 'educationSchoolName');
    service.updateTextItem(id, statusController.text, 'educationStatus');
    service.updateTextItem(id, companyController.text, 'careerCompany');
    service.updateTextItem(id, yearsController.text, 'careerYears');
    service.updateTextItem(id, partController.text, 'careerPart');
    service.updateTextItem(id, typeController.text, 'careerType');
    service.updateTextItem(id, groupcontroller.text, 'educationGroup');
    service.updateTextItem(id, groupcontroller.text, 'educationGroup');
  }

  updateSkillSet(dynamic doc) {
    EditProcessService service = context.read<EditProcessService>();
    skillList =
        service.updateList(doc, skillList, "skillSet", skillController.text);
    print('-------21312312313-------');
    print(skillList);

    // service.makeTextBox(skillSetList, skillController);
    print(schoolNameController.text);
  }

  deleteListItem(String thisText) {
    print(skillList.length);
    EditProcessService service = context.read<EditProcessService>();
    service.deleteTextBox(id, skillList, 'skillSet', thisText);
  }

  void selectCompanySwitch(String text,
      List<Map<String, dynamic>> selectedListMap, int index, dynamic doc) {
    EditProcessService service = context.read<EditProcessService>();
    bool selectedBoolValue = selectedListMap.elementAt(index)['selected'];
    print(selectedBoolValue);
    if (selectedBoolValue == false) {
      companys.add(text);
      selectedListMap.elementAt(index)['selected'] = true;
    } else {
      int i = 0;
      print('before: ${companys}');
      for (i; i < companys.length; i++) {
        print('-------!!!!!!!!!!!!!!!!!!!----');
        if (companys[i] == text) break;
      }
      print('index: ${index}');
      companys.removeAt(i);
      print('after: ${companys}');
      selectedListMap.elementAt(index)['selected'] = false;
    }
    print(companys);
    service.updateCompany(doc, companys, 'wishingCompany');
    service.updateTextBox(companys);
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
                updateEdited();
              },
              child: const Text('저장하기'),
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
                id = doc.id;
                // skillSetList = doc.get('skillSet');
                // skillSetList.add(doc.get('skillSet'));
                // UserData.fromJson(jsonDecode(jsonEncode(doc.data())));
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
                          ...SubmitWidgets.infoText("컨설턴트에게 보내는 제안서를\n수정하고 있어요",
                              '프로필을 수정하고 저장하면 자동으로 컨설턴트에게 제안서를 다시 보내드릴게요.'),
                          SizedBox(height: 20),
                          titleText('최종학력'),
                          SubmitWidgets.submitDropDownField(
                              '학력', groupcontroller, doc.get('educationGroup')),
                          SubmitWidgets.submitTextField(
                              "학교명",
                              schoolNameController,
                              doc.get('educationSchoolName')),
                          SubmitWidgets.submitDropDownField("재학 상태",
                              statusController, doc.get('educationStatus')),
                          ////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////
                          SizedBox(height: 20),
                          titleText('재직중인 회사'),
                          SubmitWidgets.submitTextField('회사', companyController,
                              doc.get('careerCompany')),
                          SubmitWidgets.submitDropDownField(
                              '년차', yearsController, doc.get('careerYears')),
                          SubmitWidgets.submitTextField(
                              '직무', partController, doc.get('careerPart')),
                          SubmitWidgets.submitDropDownField(
                              '고용형태', typeController, doc.get('careerType')),
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
                                                    .hintValueList['스킬셋'],
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
                                            updateSkillSet(doc);

                                            skillController.text = '';
                                            print(skillList);
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
                                    ...doc.get('skillSet').map((e) =>
                                        SubmitWidgets.textBox(
                                            true, e, deleteListItem)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////
                          SizedBox(height: 35),
                          titleText('목표하는 회사'),
                          ...SubmitWidgets.companyWidget(
                              '대기업',
                              companys,
                              doc,
                              internalCompanys1,
                              internalCompanys2,
                              selectCompanySwitch),
                          ...SubmitWidgets.companyWidget(
                              '해외 대기업',
                              companys,
                              doc,
                              foreignCompanys1,
                              foreignCompanys2,
                              selectCompanySwitch),
                          ...SubmitWidgets.companyWidget(
                              '유니콘',
                              companys,
                              doc,
                              unicornCompanys1,
                              unicornCompanys2,
                              selectCompanySwitch),
                          ////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////
                          SizedBox(height: 35),
                          titleText('목표하는 회사'),
                          GestureDetector(
                            onTap: () {
                              print("지금 당장 바로 할거예요 클릭 됨");
                              modifyJoinList('wishingJoinDate', 0, joinList,
                                  joinValueList);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: joinValueList[0]['selected'] == true
                                    ? Color(0xff3936f1)
                                    : Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "지금 당장 바로 할거예요",
                                  style: TextStyle(
                                    color: joinValueList[0]['selected'] == true
                                        ? Colors.white
                                        : Color(0xff3d3d3d),
                                    fontSize: 16,
                                    fontWeight:
                                        joinValueList[0]['selected'] == true
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              print("차근차근 준비해나가고 싶어요");
                              modifyJoinList('wishingJoinDate', 1, joinList,
                                  joinValueList);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: joinValueList[1]['selected'] == true
                                    ? Color(0xff3936f1)
                                    : Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "차근차근 준비해나가고 싶어요",
                                  style: TextStyle(
                                    color: joinValueList[1]['selected'] == true
                                        ? Colors.white
                                        : Color(0xff3d3d3d),
                                    fontSize: 16,
                                    fontWeight:
                                        joinValueList[1]['selected'] == true
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              print("아직은 생각이 없어요");
                              modifyJoinList('wishingJoinDate', 2, joinList,
                                  joinValueList);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: joinValueList[2]['selected'] == true
                                    ? Color(0xff3936f1)
                                    : Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "아직은 생각이 없어요",
                                  style: TextStyle(
                                    color: joinValueList[2]['selected'] == true
                                        ? Colors.white
                                        : Color(0xff3d3d3d),
                                    fontSize: 16,
                                    fontWeight:
                                        joinValueList[2]['selected'] == true
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          ////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////
                          titleText('컨설턴트에게 받고 싶은 서비스'),
                          GestureDetector(
                            onTap: () {
                              print("이력서 및 자기소개서");

                              modifyJoinList('wishingConsulting', 0,
                                  consultingList, consultingValueList);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:
                                      consultingValueList[0]['selected'] == true
                                          ? Color(0xff3936f1)
                                          : Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      consultingValueList[0]['selected'] == true
                                          ? 'assets/icons/check_chosen.png'
                                          : 'assets/icons/check_not_chosen.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "이력서 및 자기소개서",
                                      style: TextStyle(
                                        color: Color(0xff3d3d3d),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              print("경력기술서");
                              modifyJoinList('wishingConsulting', 1,
                                  consultingList, consultingValueList);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:
                                      consultingValueList[1]['selected'] == true
                                          ? Color(0xff3936f1)
                                          : Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      consultingValueList[1]['selected'] == true
                                          ? 'assets/icons/check_chosen.png'
                                          : 'assets/icons/check_not_chosen.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "경력기술서",
                                      style: TextStyle(
                                        color: Color(0xff3d3d3d),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              print("맞춤 채용공고 추천");
                              modifyJoinList('wishingConsulting', 2,
                                  consultingList, consultingValueList);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:
                                      consultingValueList[2]['selected'] == true
                                          ? Color(0xff3936f1)
                                          : Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      consultingValueList[2]['selected'] == true
                                          ? 'assets/icons/check_chosen.png'
                                          : 'assets/icons/check_not_chosen.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "맞춤 채용공고 추천",
                                      style: TextStyle(
                                        color: Color(0xff3d3d3d),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              print("퍼스널 브랜딩");
                              modifyJoinList('wishingConsulting', 3,
                                  consultingList, consultingValueList);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:
                                      consultingValueList[3]['selected'] == true
                                          ? Color(0xff3936f1)
                                          : Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      consultingValueList[3]['selected'] == true
                                          ? 'assets/icons/check_chosen.png'
                                          : 'assets/icons/check_not_chosen.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "퍼스널 브랜딩",
                                      style: TextStyle(
                                        color: Color(0xff3d3d3d),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              print("커리어 전환");
                              modifyJoinList('wishingConsulting', 4,
                                  consultingList, consultingValueList);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:
                                      consultingValueList[4]['selected'] == true
                                          ? Color(0xff3936f1)
                                          : Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      consultingValueList[4]['selected'] == true
                                          ? 'assets/icons/check_chosen.png'
                                          : 'assets/icons/check_not_chosen.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "커리어 전환",
                                      style: TextStyle(
                                        color: Color(0xff3d3d3d),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              print("면접");
                              modifyJoinList('wishingConsulting', 5,
                                  consultingList, consultingValueList);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:
                                      consultingValueList[5]['selected'] == true
                                          ? Color(0xff3936f1)
                                          : Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      consultingValueList[5]['selected'] == true
                                          ? 'assets/icons/check_chosen.png'
                                          : 'assets/icons/check_not_chosen.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "면접",
                                      style: TextStyle(
                                        color: Color(0xff3d3d3d),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              print("직무 및 기업 분석");
                              modifyJoinList('wishingConsulting', 6,
                                  consultingList, consultingValueList);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:
                                      consultingValueList[6]['selected'] == true
                                          ? Color(0xff3936f1)
                                          : Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      consultingValueList[6]['selected'] == true
                                          ? 'assets/icons/check_chosen.png'
                                          : 'assets/icons/check_not_chosen.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "직무 및 기업 분석",
                                      style: TextStyle(
                                        color: Color(0xff3d3d3d),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              print("기타");
                              modifyJoinList('wishingConsulting', 7,
                                  consultingList, consultingValueList);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:
                                      consultingValueList[7]['selected'] == true
                                          ? Color(0xff3936f1)
                                          : Colors.grey,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      consultingValueList[7]['selected'] == true
                                          ? 'assets/icons/check_chosen.png'
                                          : 'assets/icons/check_not_chosen.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "기타",
                                      style: TextStyle(
                                        color: Color(0xff3d3d3d),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
