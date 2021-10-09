import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/pages/home_pages/Readings/fact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'freakyTipsCard.dart';

class FreakyTips extends StatefulWidget {
  final String? heading;

  FreakyTips({
    Key? key,
    this.heading,
  }) : super(key: key);

  @override
  _FreakyTipsState createState() => _FreakyTipsState();
}

class _FreakyTipsState extends State<FreakyTips> {
  bool loading = true;
  List<Map> varieties = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    DocumentSnapshot snapshot = await tipsReference.doc(widget.heading).get();
    varieties = List.from(snapshot['varieties']);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Freaky Tips",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 16.0, top: 5),
                  //   child: Text(
                  //     'Freaky',
                  //     style: TextStyle(
                  //       fontSize: 40,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(left: 16.0, top: 10, bottom: 4),
                  //   child: Text(
                  //     'Tips',
                  //     style: TextStyle(
                  //       fontSize: 40,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: varieties.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.to(FactPage(
                          imageUrl: varieties[index]['url'],
                          heading: varieties[index]['heading'],
                          description: varieties[index]['content'],
                        )),
                        child: FreakyTipsCard(
                          freakyTipsImage: varieties[index]['url'],
                          freakyTipsName: varieties[index]['heading'],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
