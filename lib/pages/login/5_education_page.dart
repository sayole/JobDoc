import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/6_career_page.dart';
import 'package:provider/provider.dart';

import '../../services/login_process_service.dart';
import 'login_process_scaffold.dart';

class EducationPage extends StatefulWidget {
  EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  TextEditingController groupcontroller = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
      builder: (context, loginProcessService, child) {
        loginProcessService.addControllers(
            [groupcontroller, schoolNameController, statusController]);
        return LoginProcessScaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(text: "aaaaaaaaaaaa\n"),
                  TextSpan(text: "aaaaaaaaaaaaaaaaa\n"),
                  TextSpan(text: "aaaaaaaaaaaaaaaaaaaa\n"),
                ],
              ),
            ),
          ),
          nextPage: CareerPage(),
          index: 1,
        );
      },
    );
  }
}
