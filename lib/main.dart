import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/11_job_posting_page.dart';
import 'package:job_doc/pages/login/12_done_loading.dart';
import 'package:job_doc/pages/login/1_onboarding.dart';
import 'package:job_doc/pages/login/2_sign_in.dart';
import 'package:job_doc/pages/login/3_starting_process.dart';
import 'package:job_doc/pages/login/4_name_page.dart';
import 'package:job_doc/pages/login/5_education_page.dart';
import 'package:job_doc/pages/login/7_skill_set_page.dart';
import 'package:job_doc/pages/login/8_wishing_company_page.dart';
import 'package:job_doc/pages/login/9_wishing_join_page.dart';
import 'package:job_doc/services/auth_service.dart';
import 'package:job_doc/services/login_process_service.dart';
import 'package:provider/provider.dart';

import 'pages/main_home/main_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => LoginProcessSerivce()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          fontFamily: 'Pretendard',
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SignIn());
  }
}
