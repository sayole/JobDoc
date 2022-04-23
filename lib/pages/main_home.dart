import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_doc/models/user_data.dart';

class HomePage extends StatelessWidget {
  UserData user = UserData();

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    Future<void> onPressed() async {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      GoogleSignInAuthentication? authentication =
          await account?.authentication;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("홈페이지"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                user.name,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            user.careerCompany.isEmpty
                ? Text('')
                : Center(
                    child: Text(
                      user.careerCompany,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
            SignInButton(
              Buttons.Google,
              onPressed: onPressed,
              text: "Sign up with Google",
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
