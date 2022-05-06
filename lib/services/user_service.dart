import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/models/user_data.dart';

class UserService extends ChangeNotifier {
  final userCollection = FirebaseFirestore.instance.collection('user');
  List<Map<String, dynamic>> userData = [];
  UserData thisUser = UserData();
  String userId = '';

  User? currentUser() {
    // 현재 유저(로그인 되지 않은 경우 null 반환)
    return FirebaseAuth.instance.currentUser;
  }

  retrieveUserData(dynamic doc) async {
    UserData tmpUser = UserData.fromJson(jsonDecode(jsonEncode(doc.data())));
    tmpUser.skillSet = doc.get('skillSet');
    tmpUser.wishingCompany = doc.get('wishingCompany');
    tmpUser.wishingJoinDate = doc.get('wishingJoinDate');
    tmpUser.wishingConsulting = doc.get('wishingConsulting');
    thisUser = tmpUser;
    userId = doc.id;
  }

  Future<QuerySnapshot> getUserData() async {
    return await userCollection
        .where('uid', isEqualTo: currentUser()?.uid)
        .get();
  }

  Future<bool> checkHaveUserData() async {
    final snapshot =
        await userCollection.where('uid', isEqualTo: currentUser()?.uid).get();

    // DocumentReference docRef= userCollection.document(doc_id).collection("Dates").document();
    if (snapshot.docs.isEmpty) {
      return false;
    } else {
      userCollection
          .doc(currentUser()?.uid)
          .get()
          .then((value) => print('111111111111111111{$value.documentId}'));
      return true;
    }
  }

  void createUser() async {
    var returnValue = await userCollection.add(thisUser.toJson());
    print(returnValue);
    notifyListeners();
  }

  void updateUser() async {
    await userCollection.doc(userId).update(thisUser.toJson());
    notifyListeners();
  }

  void delete() async {
    await userCollection.doc(userId).delete();
    notifyListeners();
  }
}

//스냅샷은 빈 깡똥 찌고 함수를 실행하고 당겨오면 스냅샷이 생김, 스냅샷이 빈 깡통이 아니니까 데이터를 찍음
//다뮤먼트에 데이터가 있으니 까
