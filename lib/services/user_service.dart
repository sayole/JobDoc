import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserService extends ChangeNotifier {
  final userCollection = FirebaseFirestore.instance.collection('user');
  List<Map<String, dynamic>> userData = [];

  Future<QuerySnapshot> readUser(int? contentId) async {
    return userCollection.where('contentId', isEqualTo: contentId).get();
  }

  void createUser(String name, String uid, double star) async {
    await userCollection.add({
      'uid': uid,
    });
    notifyListeners();
  }

  void update(String docId, String review, double star) async {
    await userCollection.doc(docId).update({
      'review': review,
      'star': star,
    });
    notifyListeners();
  }

  void delete(String docId) async {
    await userCollection.doc(docId).delete();
    notifyListeners();
  }
}

//스냅샷은 빈 깡똥 찌고 함수를 실행하고 당겨오면 스냅샷이 생김, 스냅샷이 빈 깡통이 아니니까 데이터를 찍음
//다뮤먼트에 데이터가 있으니 까
