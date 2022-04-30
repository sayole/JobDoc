import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/9_wishing_join_page.dart';
import 'package:provider/provider.dart';

import '../../services/login_process_service.dart';
import 'login_process_scaffold.dart';

class WishingCompanyPage extends StatefulWidget {
  WishingCompanyPage({Key? key}) : super(key: key);

  @override
  State<WishingCompanyPage> createState() => _WishingCompanyPageState();
}

class _WishingCompanyPageState extends State<WishingCompanyPage> {
  List<String> companyController = [];

  void checkProcessDone() {
    LoginProcessSerivce service = context.read<LoginProcessSerivce>();
    service.checkProcessDone();
  }

  @override
  void initState() {
    super.initState();
    // companyController.addListener(checkProcessDone);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
        builder: (context, loginProcessService, child) {
      loginProcessService.addControllers([companyController]);
      return LoginProcessScaffold(
        body: Text('hello'),
        nextPage: WishingJoinPage(),
        index: 4,
      );
    });
  }
}
