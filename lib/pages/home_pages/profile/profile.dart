import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double bmiValue=0.0;
  double immuneScore=0.0;

  Widget noPlan() {
    return Align(
      alignment: Alignment(0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
            child: Text(
              'Exercise Progress',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 22,
                color: Color(0xFF333B5E),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.92,
              height: 133,
              constraints: BoxConstraints(
                maxWidth: 450,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF5C54E2), Color(0xFFAD51A5)],
                  stops: [0, 1],
                  begin: Alignment(1, 0),
                  end: Alignment(-1, 0),
                ),
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        'No Plans',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () => Get.toNamed(Routes.FREAKY_PLANS),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Select Plans',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xFF151515),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getSavedVal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bmiValue= sharedPreferences.getDouble("BMIValue") ?? 0.0;
    immuneScore= sharedPreferences.getDouble("immuneScore") ?? 0.0;
    // print(bmiValue);
    // print(immuneScore);
  }

  @override
  void initState() {
    super.initState();
    getSavedVal();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xFF333B5E),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.ellipsisH,
              color: Color(0xFF333B5E),
              size: 17,
            ),
            onPressed: () => Get.toNamed(Routes.EDIT_PROFILE),
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                    child: Container(
                      width: 120,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        currentUser?.url ?? 'assets/images/profile.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text(
                    "${currentUser?.username}",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xFF151515),
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                      child: Text(
                        'Assessment',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 22,
                          color: Color(0xFF333B5E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    FutureBuilder(
                        future: getSavedVal(),
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  height: 133,
                                  constraints: BoxConstraints(
                                    maxWidth: 220,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF5C54E2), Color(0xFFAD51A5)],
                                      stops: [0, 1],
                                      begin: Alignment(1, 0),
                                      end: Alignment(-1, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                          child: Text(
                                            'BMI',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                          child: Text(
                                            '${bmiValue.toStringAsFixed(1)}',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  height: 133,
                                  constraints: BoxConstraints(
                                    maxWidth: 220,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xFF5C54E2), Color(0xFFAD51A5)],
                                      stops: [0, 1],
                                      begin: Alignment(1, 0),
                                      end: Alignment(-1, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(1, 10, 0, 5),
                                          child: Text(
                                            'Immunity Checker',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: CircularPercentIndicator(
                                            radius: 64.0,
                                            lineWidth: 10.0,
                                            animation: true,
                                            percent: immuneScore/10,
                                            center: Text(
                                              "${(immuneScore*10).toInt()}%",
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: Colors.white24,
                                            circularStrokeCap:
                                            CircularStrokeCap.round,
                                            progressColor: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                    ),
                  ],
                ),
              ),
              currentUser != null
                  ? FutureBuilder(
                future: plans.doc(currentUser!.id).get(),
                builder:
                    (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  if (!snapshot.data!.exists) return noPlan();
                  List<Map> plans = List.from(snapshot.data!['plans']);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: plans.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          //height: 133,
                          constraints: BoxConstraints(
                            maxWidth: 450,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF5C54E2),
                                Color(0xFFAD51A5)
                              ],
                              stops: [0, 1],
                              begin: Alignment(1, 0),
                              end: Alignment(-1, 0),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  child: Text(
                                    plans[index]['planName'],
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CircularPercentIndicator(
                                    radius: 64.0,
                                    lineWidth: 10.0,
                                    animation: true,
                                    percent: 0.41,
                                    center: Text(
                                      plans[index]['timeStamp'],
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.white24,
                                    circularStrokeCap:
                                    CircularStrokeCap.round,
                                    progressColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
                  : noPlan(),
            ],
          ),
        ),
      ),
    );
  }
}