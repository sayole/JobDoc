import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class LoginProcessScaffold extends StatelessWidget {
  const LoginProcessScaffold(
      {Key? key,
      required this.body,
      required this.nextPage,
      required this.index})
      : super(key: key);
  final Widget body;
  final Widget nextPage;
  final double index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/left_arrow.png',
            width: MediaQuery.of(context).size.width * 0.06,
          ),
          onPressed: () => {Navigator.pop(context)},
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FAProgressBar(
                currentValue: index,
                size: 2,
                maxValue: 7,
                backgroundColor: Colors.grey,
                progressColor: const Color(0xff3936f1),
                animatedDuration: const Duration(milliseconds: 400),
                direction: Axis.horizontal,
                verticalDirection: VerticalDirection.up,
              ),
              body,
              Spacer(),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nextPage),
                  ),
                },
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFF3936F1)),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Center(
                      child: Text(
                        '프로필 작성하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              )
            ],
          ),
        ),
      ),
    );
  }
}
