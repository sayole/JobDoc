import 'package:flutter/material.dart';

class LoginProcessSerivce extends ChangeNotifier {
  List<dynamic> controllers = [];
  bool isDone = false;

  void addControllers(List<dynamic> localControllers) {
    for (dynamic singleController in localControllers) {
      controllers.add(singleController);
    }
  }

  checkProcessDone() {
    for (var controller in controllers) {
      if (controller.text == '') {
        return;
      }
    }
    isDone = true;
    notifyListeners();
  }

  bool clearBucket() {
    controllers.clear();
    notifyListeners();
    return false;
  }
}
