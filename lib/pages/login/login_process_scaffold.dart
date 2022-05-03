import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:job_doc/services/login_process_service.dart';
import 'package:provider/provider.dart';

class LoginProcessScaffold extends StatefulWidget {
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
  State<LoginProcessScaffold> createState() => _LoginProcessScaffoldState();
}

class _LoginProcessScaffoldState extends State<LoginProcessScaffold> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProcessSerivce>(
      builder: (context, loginProcessService, child) {
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
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          widget.index == 0
                              ? SizedBox(height: 2)
                              : FAProgressBar(
                                  currentValue: widget.index,
                                  size: 2,
                                  maxValue: 8,
                                  backgroundColor: Colors.grey,
                                  progressColor: const Color(0xff3936f1),
                                  animatedDuration:
                                      const Duration(milliseconds: 400),
                                  direction: Axis.horizontal,
                                  verticalDirection: VerticalDirection.up,
                                ),
                          widget.body,
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: loginProcessService.isDone
                            ? () => {
                                  loginProcessService.isDone = false,
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => widget.nextPage),
                                  ),
                                }
                            : null,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 16,
                          decoration: BoxDecoration(
                            color: loginProcessService.isDone
                                ? Color(0xFF3936F1)
                                : Color(0xffdfdfdf),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Center(
                              child: Text(
                                '다음',
                                style: TextStyle(
                                  color: loginProcessService.isDone
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
