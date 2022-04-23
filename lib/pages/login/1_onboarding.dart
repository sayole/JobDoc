import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          Text('빠르고 확실한'),
          Text('커리어 컨설턴트 매칭'),
        ],
      ),
    );
  }
}
