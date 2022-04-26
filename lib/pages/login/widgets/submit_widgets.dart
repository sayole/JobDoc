import 'package:flutter/cupertino.dart';

import 'login_styles.dart';

class SubmitWidgets {
  final List<String> _valueList = ['서울', '인천', '수원', '대전', '대구', '광주', '부산'];

  static List<Widget> infoText(String headline, String caption) {
    return [
      SizedBox(height: 20),
      Text(headline, style: LoginStyles.headline),
      SizedBox(height: 20),
      Text(
        caption,
        style: LoginStyles.caption,
      ),
      SizedBox(height: 25),
    ];
  }
}