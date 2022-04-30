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

  deleteTextBox(List<String> skillsetList, String thisText) {
    print('흠');
    print(thisText);
    skillsetList.remove(thisText);
    notifyListeners();
  }

  makeTextBox(List<String> skillsetList) {
    skillsetList.add(controllers[0].text);
    controllers[0].text = '';
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
