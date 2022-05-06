import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/11_job_posting_page.dart';
import 'package:job_doc/pages/login/12_done_loading.dart';
import 'package:job_doc/pages/login/widgets/submit_widgets.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';

import '../../services/login_process_service.dart';
import 'login_process_scaffold.dart';

class WishingConsultingPage extends StatefulWidget {
  WishingConsultingPage({Key? key}) : super(key: key);

  @override
  State<WishingConsultingPage> createState() => _WishingConsultingPageState();
}

class _WishingConsultingPageState extends State<WishingConsultingPage> {
  List<String> consultingList = [];
  List<Map<String, dynamic>> valueList = [
    {'name': '이력서 및 자기소개서', 'selected': false},
    {'name': '경력기술서', 'selected': false},
    {'name': '맞춤 채용공고 추천', 'selected': false},
    {'name': '퍼스널 브랜딩', 'selected': false},
    {'name': '커리어 전환', 'selected': false},
    {'name': '면접', 'selected': false},
    {'name': '직무 및 기업 분석', 'selected': false},
    {'name': '기타', 'selected': false},
  ];

  modifyJoinList(int index) {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    valueList[index]['selected'] = !valueList[index]['selected'];
    if (valueList[index]['selected'] == true) {
      consultingList.add(valueList[index]['name']);
      service.updateTextBox(consultingList);
    } else {
      consultingList.remove(valueList[index]['name']);
      service.deleteTextBox(consultingList, valueList[index]['name']);
    }
    UserService userService = context.read<UserService>();
    userService.thisUser.wishingConsulting = consultingList;
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
              ...SubmitWidgets.infoText('컨설턴트에게 어떤 도움을 받고 싶으세요?',
                  '받고 싶은 서비스를 모두 골라주세요. 컨설턴트와 상담 시 변결할 수 있어요'),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print("이력서 및 자기소개서");
                  modifyJoinList(0);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: valueList[0]['selected'] == true
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
                          valueList[0]['selected'] == true
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
                  modifyJoinList(1);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: valueList[1]['selected'] == true
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
                          valueList[1]['selected'] == true
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
                  modifyJoinList(2);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: valueList[2]['selected'] == true
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
                          valueList[2]['selected'] == true
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
                  modifyJoinList(3);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: valueList[3]['selected'] == true
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
                          valueList[3]['selected'] == true
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
                  modifyJoinList(4);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: valueList[4]['selected'] == true
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
                          valueList[4]['selected'] == true
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
                  modifyJoinList(5);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: valueList[5]['selected'] == true
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
                          valueList[5]['selected'] == true
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
                  modifyJoinList(6);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: valueList[6]['selected'] == true
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
                          valueList[6]['selected'] == true
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
                  modifyJoinList(7);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: valueList[7]['selected'] == true
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
                          valueList[7]['selected'] == true
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
              SizedBox(height: 8),
            ],
          ),
        ),
        nextPage: DoneLoading(),
        index: 6,
      );
    });
  }
}
