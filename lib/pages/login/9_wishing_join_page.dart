import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/10_wishing_consulting_page.dart';
import 'package:job_doc/pages/login/widgets/submit_widgets.dart';
import 'package:job_doc/services/login_process_service.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';

import 'login_process_scaffold.dart';

class WishingJoinPage extends StatefulWidget {
  WishingJoinPage({Key? key}) : super(key: key);

  @override
  State<WishingJoinPage> createState() => _WishingJoinPageState();
}

class _WishingJoinPageState extends State<WishingJoinPage> {
  List<String> joinList = [];
  List<Map<String, dynamic>> valueList = [
    {'name': '지금 당장 바로 할거예요', 'selected': false},
    {'name': '차근차근 준비해나가고 싶어요', 'selected': false},
    {'name': '아직은 생각이 없어요', 'selected': false}
  ];
  void checkProcessDone() {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    UserService userService = context.read<UserService>();
    userService.thisUser.wishingJoinDate = joinList;
    service.checkProcessDone();
  }

  @override
  void initState() {
    super.initState();
  }

  modifyJoinList(int index) {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    valueList[index]['selected'] = !valueList[index]['selected'];
    if (valueList[index]['selected'] == true) {
      joinList.add(valueList[index]['name']);
      service.updateTextBox(joinList);
    } else {
      joinList.remove(valueList[index]['name']);
      service.deleteTextBox(joinList, valueList[index]['name']);
    }
    UserService userService = context.read<UserService>();
    userService.thisUser.wishingJoinDate = joinList;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
        builder: (context, loginProcessService, child) {
      return LoginProcessScaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...SubmitWidgets.infoText('언제 새 회사에 입사하고 싶으신가요?',
                  '지금 떠오르는 생각을 입력해주세요. 컨설턴트와 직접 상담하면서 나중에 구체적으로 계획을 세울 수 있어요.'),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print("지금 당장 바로 할거예요 클릭 됨");
                  modifyJoinList(0);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: valueList[0]['selected'] == true
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
                        color: valueList[0]['selected'] == true
                            ? Colors.white
                            : Color(0xff3d3d3d),
                        fontSize: 16,
                        fontWeight: valueList[0]['selected'] == true
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
                  modifyJoinList(1);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: valueList[1]['selected'] == true
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
                        color: valueList[1]['selected'] == true
                            ? Colors.white
                            : Color(0xff3d3d3d),
                        fontSize: 16,
                        fontWeight: valueList[1]['selected'] == true
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
                  modifyJoinList(2);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: valueList[2]['selected'] == true
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
                        color: valueList[2]['selected'] == true
                            ? Colors.white
                            : Color(0xff3d3d3d),
                        fontSize: 16,
                        fontWeight: valueList[2]['selected'] == true
                            ? FontWeight.w600
                            : FontWeight.w400,
                        letterSpacing: -0.6,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        nextPage: WishingConsultingPage(),
        index: 5,
      );
    });
  }
}
