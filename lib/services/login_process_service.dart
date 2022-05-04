import 'package:flutter/material.dart';

class LoginProcessSerivce extends ChangeNotifier {
  List<dynamic> controllers = [];
  bool isDone = false;

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
      TextEditingController myController) {
    if (controllers[0].text == '') {
      return;
    }
    skillsetList.add(controllers[0].text);
    controllers[0].text = '';
    updateData();
    isDone = true;
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
