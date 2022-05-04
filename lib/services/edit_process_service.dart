import 'package:flutter/material.dart';

class EditProcessService extends ChangeNotifier {
  List<dynamic> controllers = [];
  bool isDone = false;

  void notifyFunction() {
    notifyListeners();
  }

  void addControllers(List<dynamic> localControllers) {
    controllers.clear();

    for (dynamic singleController in localControllers) {
      controllers.add(singleController);
    }
  }

  deletePost(List<String> postList, String thisText) {
    print('hello');
    print(postList);
    // postList.remove(thisText);
  }

  updateTextBox(List<String> valueList) {
    if (valueList.length == 0) {
      isDone = false;
    } else {
      isDone = true;
    }
    notifyListeners();
  }

  deleteTextBox(List<String> valueList, String thisText) {
    valueList.remove(thisText);
    if (valueList.length == 0) isDone = false;
    notifyListeners();
  }

  makeTextBox(List<String> skillsetList, Function updateData,
      TextEditingController controller) {
    if (controller.text == '') {
      return;
    }
    skillsetList.add(controller.text);
    controller.text = '';
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