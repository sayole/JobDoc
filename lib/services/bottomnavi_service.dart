import 'package:job_doc/pages/main_home/main_home_type1.dart';
import 'package:flutter/material.dart';
import '../pages/main_home/settings.dart';
import '../pages/myPage/my_page.dart';
import '../pages/proposal/proposal_list.dart';

class btmNavProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
