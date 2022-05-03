import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/4_name_page.dart';
import 'package:job_doc/pages/login/5_education_page.dart';
import 'package:job_doc/pages/login/widgets/login_styles.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';

class StartingProcess extends StatelessWidget {
  const StartingProcess({Key? key}) : super(key: key);

  test() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(builder: (context, userService, child) {
      return Scaffold(
        appBar: AppBar(
          leading: Text(''),
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: LoginStyles.headline,
                      children: [
                        TextSpan(text: "간단한 질문에 답해주시면\n"),
                        TextSpan(text: "저희가 프로필을 만들어서\n"),
                        TextSpan(text: "컨설턴트에게 제안서를 보내드릴게요\n"),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => NamePage()),
                    // ),
                    // service.createUser(),
                    //
                    userService.userData,
                    print(userService.currentUser()?.displayName),
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFF3936F1)),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: Text(
                          '프로필 작성하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
