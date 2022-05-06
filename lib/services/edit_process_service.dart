import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditProcessService extends ChangeNotifier {
  final userCollection = FirebaseFirestore.instance.collection('user');
  List<dynamic> controllers = [];
  bool isDone = false;

  void notifyFunction() async {
    notifyListeners();
  }

  updateList(
      dynamic id, List<dynamic> updatingList, String name, String text) async {
    updatingList.add(text);
    await userCollection.doc(id).update({name: updatingList});
    notifyListeners(); // 화면 갱신
  }

  updateTextBox(List<String> valueList) {
    if (valueList.length == 0) {
      isDone = false;
    } else {
      isDone = true;
    }
    notifyListeners();
  }

  deleteTextBox(List<dynamic> valueList, String name, String thisText) async {
    valueList.remove(thisText);
    notifyListeners();
  }

  makeTextBox(List<dynamic> skillsetList, TextEditingController controller) {
    if (controller.text == '') {
      return;
    }
    isDone = true;
    skillsetList.add(controller.text);
    controller.text = '';
    print('make');
    print(skillsetList);
    notifyListeners();
  }

  checkProcessDone() {
    for (var controller in controllers) {
      if (controller.text == '') {
        isDone = false;
        return;
      }
    }
    isDone = true;
    notifyListeners();
  }

  clearControllers() {
    controllers.clear();
  }
}
