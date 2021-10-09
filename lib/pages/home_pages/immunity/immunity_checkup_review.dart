import 'package:fitness_app/pages/home_pages/immunity/immunity_report.dart';
import 'package:fitness_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImmunityCheckupReviewPage extends StatefulWidget {
  const ImmunityCheckupReviewPage({Key? key, this.review = const []})
      : super(key: key);

  final List<Map> review;

  @override
  _ImmunityCheckupReviewPageState createState() =>
      _ImmunityCheckupReviewPageState();
}

class _ImmunityCheckupReviewPageState extends State<ImmunityCheckupReviewPage> {
  List<Map> review = [];
  num immunePoint = 0;
  num immuneScore = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      review = widget.review;
      for (int i = 0; i < review.length; i++) {
        print(review.elementAt(i)["point"]);
        immunePoint = immunePoint + review.elementAt(i)["point"];
      }
      immuneScore = immunePoint / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 130),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () => Get.toNamed(Routes.HOME),
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                ),
              ),
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                'Immunity Checkup',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Text(
                  "Review your answers",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 20,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.review.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 5,
                            height: 75,
                            decoration: BoxDecoration(
                              gradient: index != 0
                                  ? LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xfff35396),
                                        Color(0xfffa6052)
                                      ],
                                    )
                                  : LinearGradient(colors: [
                                      Colors.transparent,
                                      Colors.transparent
                                    ]),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xfff35396), Color(0xfffa6052)],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                  color: Color(0xfffbfbfb),
                                  fontSize: 20,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 5,
                            height: 75,
                            decoration: BoxDecoration(
                              gradient: index != (widget.review.length - 1)
                                  ? LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xfff35396),
                                        Color(0xfffa6052)
                                      ],
                                    )
                                  : LinearGradient(colors: [
                                      Colors.transparent,
                                      Colors.transparent
                                    ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: 245,
                            height: 170,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 240,
                                      height: 163,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x26000000),
                                            blurRadius: 15,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(
                                        left: 6,
                                        right: 19,
                                        top: 24,
                                        bottom: 22,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 215,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFE2E1EF),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                widget.review
                                                    .elementAt(index)["ans"],
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      63, 63, 67, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 15,
                                  child: Container(
                                    width: 220,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xffad51a5),
                                          Color(0xff5c54e2)
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.review.elementAt(index)["que"],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(89, 97, 249, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                onPressed: () {
                  // Get.toNamed(
                  //   Routes.IMMUNITY_REPORT,
                  //   arguments: {'immuneNumber': immuneScore*10},
                  // );
                  Get.to(() => ImmunityReport(immuneNumber: immuneScore));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    "Submit",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
