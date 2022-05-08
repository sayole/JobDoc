//login 시 UserInfo 생성해서 로그인 과정동안 저장
//회원정보 Read, Update, Delete 총괄 서비스

// 구글 로그인 연동
// https://jamie-dev.tistory.com/128

// 페이스북 로그인 연동
//https://www.youtube.com/watch?v=Ai3QWQ_1pJM

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// 기본 로그인
class AuthService extends ChangeNotifier {
  User? currentUser() {
    // 현재 유저(로그인 되지 않은 경우 null 반환)
    return FirebaseAuth.instance.currentUser;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  void signOut() async {
    print(FirebaseAuth.instance.currentUser);

    // 로그아웃
    await FirebaseAuth.instance.signOut();
    print(FirebaseAuth.instance.currentUser);
    notifyListeners(); // 로그인 상태 변경 알림
  }

  void deleteUser() async {
    final userCollection = FirebaseFirestore.instance.collection('user');
    userCollection.doc(currentUser()?.uid).get();
    final user = FirebaseAuth.instance.currentUser;
    user?.delete();
  }
}
