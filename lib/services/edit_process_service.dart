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
      dynamic doc, List<dynamic> updatingList, String name, String text) async {
    updatingList = doc.get('skillSet');
    updatingList.add(text);
    print('--------------');
    print(updatingList);
    await userCollection.doc(doc.id).update({name: updatingList});
    notifyListeners(); // 화면 갱신
  }

  updateListItem(String id, List<dynamic> updatingList, String name) async {
    await userCollection.doc(id).update({name: updatingList});
    notifyListeners(); // 화면 갱신
  }

  updateTextItem(String id, String text, String name) async {
    await userCollection.doc(id).update({name: text});
    notifyListeners(); // 화면 갱신
  }

  updateCompany(dynamic doc, List<dynamic> updatingList, String name) async {
    print(updatingList);
    await userCollection.doc(doc.id).update({name: updatingList});
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

  deleteTextBox(
      dynamic id, List<dynamic> valueList, String name, String thisText) async {
    print(valueList);
    valueList.remove(thisText);
    await userCollection.doc(id).update({name: valueList});
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
