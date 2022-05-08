import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/models/user_data.dart';

class UserService extends ChangeNotifier {
  final userCollection = FirebaseFirestore.instance.collection('user');
  List<Map<String, dynamic>> userData = [];
  UserData thisUser = UserData();

  User? currentUser() {
    // 현재 유저(로그인 되지 않은 경우 null 반환)
    return FirebaseAuth.instance.currentUser;
  }

  Future<QuerySnapshot> getUserData() async {
    // QuerySnapshot snapshot =
    //     await userCollection.where('uid', isEqualTo: currentUser()?.uid).get();
    // print(snapshot.docs[0].data());
    // Object? user = snapshot.docs[0].data();
    // thisUser = UserData.fromJson(snapshot.docs[0].data() as Map);
    // print('2222222222222222222${thisUser.name}');
    // // thisUser = UserData.fromJson(snapshot.docs[0].data());
    // return snapshot;

    // return await userCollection
    //     .where('uid', isEqualTo: currentUser()?.uid)
    //     .get();
    return await userCollection
        .where('uid', isEqualTo: currentUser()?.uid)
        .get();
  }

  Future<bool> checkHaveUserData() async {
    final snapshot =
        await userCollection.where('uid', isEqualTo: currentUser()?.uid).get();

    if (snapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void createUser() async {
    var returnValue = await userCollection.add(thisUser.toJson());
    print(returnValue);
    notifyListeners();
  }

  void update(String docId, UserData user) async {
    await userCollection.doc(docId).update(user.toJson());
    notifyListeners();
  }

  void delete(String docId) async {
    await userCollection.doc(docId).delete();
    notifyListeners();
  }
}

//스냅샷은 빈 깡똥 찌고 함수를 실행하고 당겨오면 스냅샷이 생김, 스냅샷이 빈 깡통이 아니니까 데이터를 찍음
//다뮤먼트에 데이터가 있으니 까
