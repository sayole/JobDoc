import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_doc/models/user_data.dart';

class HomePage extends StatelessWidget {
  UserData user = UserData();

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "홈페이지",
            style: TextStyle(fontFamily: 'Pretendard'),
          ),
        ),
        body: Center(
          child: Text("hello"),
        ));
  }
}
