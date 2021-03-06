import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/9_wishing_join_page.dart';
import 'package:job_doc/pages/login/widgets/login_styles.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';

import '../../services/login_process_service.dart';
import 'login_process_scaffold.dart';
import 'widgets/submit_widgets.dart';

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

  selectCompanySwitch(
      String text, List<Map<String, dynamic>> selectedListMap, int index) {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    bool selectedBoolValue = selectedListMap.elementAt(index)['selected'];

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
              ...SubmitWidgets.companyWidget('대기업', internalCompanys1,
                  internalCompanys2, selectCompanySwitch),
              ...SubmitWidgets.companyWidget('해외 대기업', foreignCompanys,
                  foreignCompanys, selectCompanySwitch),
              ...SubmitWidgets.companyWidget(
                  '유니콘', unicornCompanys, unicornCompanys, selectCompanySwitch),
            ],
          ),
        ),
        nextPage: WishingJoinPage(),
        index: 4,
      );
    });
  }
}
