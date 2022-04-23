import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/1_onboarding.dart';
import 'package:job_doc/pages/login/2_sign_in.dart';
import 'package:job_doc/pages/main_home.dart';
import 'package:job_doc/palette.dart';
import 'package:job_doc/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
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
        primaryColor: Palette.background,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SignIn(),
    );
  }
}
