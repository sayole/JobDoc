import 'package:flutter/material.dart';

class LoginProcessSerivce extends ChangeNotifier {
  List<dynamic> controllers = [];
  bool isDone = false;

  void addControllers(List<dynamic> localControllers) {
    controllers.clear();

    for (dynamic singleController in localControllers) {
      print(singleController);
      controllers.add(singleController);
    }
  }

  checkProcessDone() {
    for (var controller in controllers) {
      print(controller);
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
