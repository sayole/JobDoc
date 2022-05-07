import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProposalList extends StatelessWidget {
  ProposalList({Key? key}) : super(key: key);

  List card_colors = [
    0xFFF817BFA,
    0xFFF9680EF,
    0xFFF3D7BFC,
    0xFFF63BEBE,
    0xFFF71A5DE,
    0xFFF71A5DE,
    0xFFFB967E0,
    0xFFF89A4E1,
    0xFFF37ABEC,
    0xFFFD790D4,
    0xFFF246DB0,
  ];

  List card_list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "나의견적",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: FirebaseFirestore.instance
              .collection('proposal_list')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              snapshot.data!.docs.forEach((value) {
                card_list = [...card_list, value.data()!];
              });
              return ListView.separated(
                  itemBuilder: (context, index) =>
                      card_list[index] != 'undefined'
                          ? proposal_card(
                              card_list[index]["date"],
                              card_list[index]["title"],
                              card_list[index]["tag"],
                              card_list[index]["text"],
                              card_list[index]["amount"],
                              card_colors[index % 10],
                            )
                          : SizedBox(),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: card_list.length);
            }
          }),
    );
  }
}

class proposal_card extends StatelessWidget {
  late String card_date;
  late String card_title;
  late String card_tag;
  late String card_text;
  late String card_amount;
  late int card_colors;

  proposal_card(this.card_date, this.card_title, this.card_tag, this.card_text,
      this.card_amount, this.card_colors);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                card_date,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Text(
                      "자세히 보기",
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: -0.6,
                      ),
                    ),
                    Image.asset(
                      "assets/icons/right_arrow.png",
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(card_colors),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, bottom: 12, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card_title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    card_tag,
                    style: TextStyle(
                        color: Color(0xFFF3936F1),
                        fontSize: 10,
                        letterSpacing: -0.6,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 192,
                    child: Text(
                      card_text,
                      style: TextStyle(
                        color: Color(0xFFF3D3D3D),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        letterSpacing: -0.6,
                      ),
                    ),
                  ),
                  SizedBox(height: 56),
                  Text(
                    card_amount,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: -0.6,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
