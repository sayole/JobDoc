import 'package:flutter/material.dart';
import 'package:job_doc/widgets/proposal_card.dart';

class proposal_list extends StatelessWidget {
  const proposal_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "나의견적",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return proposal_card();
        },
      ),
    );
  }
}
