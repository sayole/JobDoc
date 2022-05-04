import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/9_wishing_join_page.dart';
import 'package:job_doc/pages/login/widgets/login_styles.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';

import '../../services/login_process_service.dart';
import 'login_process_scaffold.dart';
import 'widgets/submit_widgets.dart';

class WishingCompanyPage extends StatefulWidget {
  WishingCompanyPage({Key? key}) : super(key: key);

  @override
  State<WishingCompanyPage> createState() => _WishingCompanyPageState();
}

class _WishingCompanyPageState extends State<WishingCompanyPage> {
  List<String> companys = [];
  // List<String> internalCompanys1 = ['삼성', '현대', '네이버', '엘지', '카카오', '쿠팡', '토스'];
  List<Map<String, dynamic>> companyList = [
    {'name': '삼성', 'selected': false, 'group': 'internalCompany1'},
    {'name': '현대', 'selected': false, 'group': 'internalCompany1'},
    {'name': '네이버', 'selected': false, 'group': 'internalCompany1'},
    {'name': '엘지', 'selected': false, 'group': 'internalCompany1'},
    {'name': '카카오', 'selected': false, 'group': 'internalCompany1'},
    {'name': '쿠팡', 'selected': false, 'group': 'internalCompany1'},
    {'name': '토스', 'selected': false, 'group': 'internalCompany1'},
    {'name': '야놀자', 'selected': false, 'group': 'internalCompany2'},
    {'name': '당근마켓', 'selected': false, 'group': 'internalCompany2'},
    {'name': '배달의 민족', 'selected': false, 'group': 'internalCompany2'},
    {'name': '오늘의 집', 'selected': false, 'group': 'internalCompany2'},
    {'name': '라인', 'selected': false, 'group': 'internalCompany2'},
    {'name': '무신사', 'selected': false, 'group': 'internalCompany2'},
    {'name': 'Apple', 'selected': false, 'group': 'foreignCompanys'},
    {'name': 'Google', 'selected': false, 'group': 'foreignCompanys'},
    {'name': 'Tesla', 'selected': false, 'group': 'foreignCompanys'},
    {'name': 'Meta', 'selected': false, 'group': 'unicornCompanys'},
    {'name': 'Zoom', 'selected': false, 'group': 'unicornCompanys'},
    {'name': 'IONIQ', 'selected': false, 'group': 'unicornCompanys'}
  ];

  List<Map<String, dynamic>> internalCompanys1 = [
    {'name': '삼성', 'selected': false},
    {'name': '현대', 'selected': false},
    {'name': '네이버', 'selected': false},
    {'name': '엘지', 'selected': false},
    {'name': '카카오', 'selected': false},
    {'name': '쿠팡', 'selected': false},
    {'name': '토스', 'selected': false}
  ];

  List<Map<String, dynamic>> internalCompanys2 = [
    {'name': '야놀자', 'selected': false},
    {'name': '당근마켓', 'selected': false},
    {'name': '배달의 민족', 'selected': false},
    {'name': '오늘의 집', 'selected': false},
    {'name': '라인', 'selected': false},
    {'name': '무신사', 'selected': false},
  ];
  List<Map<String, dynamic>> foreignCompanys = [
    {'name': 'Apple', 'selected': false},
    {'name': 'Google', 'selected': false},
    {'name': 'Tesla', 'selected': false}
  ];
  List<Map<String, dynamic>> unicornCompanys = [
    {'name': 'Meta', 'selected': false},
    {'name': 'Zoom', 'selected': false},
    {'name': 'IONIQ', 'selected': false}
  ];

  void checkProcessDone() {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    UserService userService = context.read<UserService>();
    userService.thisUser.wishingCompany = companys;
    service.checkProcessDone();
  }

  @override
  void initState() {
    super.initState();
    // companyController.addListener(checkProcessDone);
  }

  checkName(List<Map<String, dynamic>> checkingListMap, String selectedText) {
    for (int i = 1; i <= checkingListMap.length; i++) {
      if (checkingListMap[i]['name'] == selectedText) return i;
    }
    return 0;
  }

  selectCompanySwitch(String text, List<dynamic> selectedListMap, int index) {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    bool selectedBoolValue = selectedListMap.elementAt(index)['selected'];

    // ignore: unrelated_type_equality_checks
    if (selectedBoolValue == false) {
      companys.add(text);
      selectedListMap.elementAt(index)['selected'] = true;
    } else {
      int i = 0;
      for (i; i <= companys.length; i++) {
        if (companys[i] == text) break;
      }
      companys.removeAt(i);
      selectedListMap.elementAt(index)['selected'] = false;
    }
    UserService userService = context.read<UserService>();
    userService.thisUser.wishingCompany = companys;
    service.updateTextBox(companys);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
        builder: (context, loginProcessService, child) {
      // loginProcessService.addControllers([companyController]);
      return LoginProcessScaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...SubmitWidgets.infoText('목표하는 회사를 모두 골라주세요',
                  '선택하신 회사 합격 경험이 있는 컨섵턴트를 우선적으로 매칭해 드릴게요'),
              SizedBox(
                height: 30,
              ),
              /////////////////////////////////////////////////////
              Text(
                '대기업',
                style: LoginStyles.textFieldSubtitle,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Wrap(
                        alignment: WrapAlignment.start, // 정렬 방식
                        spacing: 10, // 상하(좌우) 공간
                        children: [
                          ...companyList
                              .where((element) =>
                                  element['group'] == 'internalCompany1')
                              .toList()
                              .asMap()
                              .entries
                              .map((e) => SubmitWidgets.textBox(
                                  e.value['selected'],
                                  e.value['name'] ?? '',
                                  (a) => selectCompanySwitch(
                                      a, internalCompanys1, e.key)))
                        ],
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      children: [
                        ...internalCompanys2.asMap().entries.map((e) =>
                            SubmitWidgets.textBox(
                                e.value['selected'],
                                e.value['name'] ?? '',
                                (a) => selectCompanySwitch(
                                    a, internalCompanys2, e.key)))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ///////////////////////////////////////////////////////////////////////////
              Text(
                '해외 대기업',
                style: LoginStyles.textFieldSubtitle,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Wrap(
                        alignment: WrapAlignment.start, // 정렬 방식
                        spacing: 10, // 상하(좌우) 공간
                        children: [
                          ...foreignCompanys.asMap().entries.map((e) =>
                              SubmitWidgets.textBox(
                                  e.value['selected'],
                                  e.value['name'] ?? '',
                                  (a) => selectCompanySwitch(
                                      a, foreignCompanys, e.key)))
                        ],
                      ),
                    ),
                    // Wrap(
                    //   alignment: WrapAlignment.start,
                    //   spacing: 10,
                    //   children: [
                    //     ...internalCompanys2.map((e) =>
                    //         SubmitWidgets.textBox('blue', e, deleteSkillSet))
                    //   ],
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ///////////////////////////////////////////////////////////////////
              Text(
                '유니콘',
                style: LoginStyles.textFieldSubtitle,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Wrap(
                        alignment: WrapAlignment.start, // 정렬 방식
                        spacing: 10, // 상하(좌우) 공간
                        children: [
                          ...unicornCompanys.asMap().entries.map((e) =>
                              SubmitWidgets.textBox(
                                  e.value['selected'],
                                  e.value['name'] ?? '',
                                  (a) => selectCompanySwitch(
                                      a, unicornCompanys, e.key)))
                        ],
                      ),
                    ),
                    // Wrap(
                    //   alignment: WrapAlignment.start,
                    //   spacing: 10,
                    //   children: [
                    //     ...internalCompanys2.map((e) =>
                    //         SubmitWidgets.textBox('blue', e, deleteSkillSet))
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
        nextPage: WishingJoinPage(),
        index: 4,
      );
    });
  }
}
