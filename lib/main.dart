import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/3_starting_process.dart';
import 'package:job_doc/services/auth_service.dart';
import 'package:job_doc/services/login_process_service.dart';
import 'package:provider/provider.dart';

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
      home: StartingProcess(),
    );
  }
}
