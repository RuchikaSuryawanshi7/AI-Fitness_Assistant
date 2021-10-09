import 'package:fitness_app/constant/theme.dart';
import 'package:fitness_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ImmunityReport extends StatelessWidget {
  final num immuneNumber;

  late String containerBackground;
  late String healthRemarks1;
  late String healthRemarks2;

  ImmunityReport({Key? key, this.immuneNumber = 8.0}) : super(key: key);

  immuneResult(immuneNumber) {
    if (immuneNumber > 7) {
      containerBackground = 'assets/images/greenTheme.png';
      healthRemarks2 = 'Good Health';
      healthRemarks1 = 'Congratulations!';
    } else if (immuneNumber > 5) {
      containerBackground = 'assets/images/yellowTheme.PNG';
      healthRemarks2 = 'Average Health';
      healthRemarks1 = 'Good';
    } else {
      containerBackground = 'assets/images/redTheme.PNG';
      healthRemarks2 = 'Bad Health';
      healthRemarks1 = 'Sorry';
    }
  }

  @override
  Widget build(BuildContext context) {
    immuneResult(immuneNumber);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          color: Color(0xFF333B5E),
          onPressed: () => Get.toNamed(Routes.HOME),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 17,
          ),
        ),
        title: Text(
          'Immunity Report',
          style: CustomTheme.title3.override(
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
            onPressed: () {
              print('Ellipsis icon pressed');
            },
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Container(
                    width: double.infinity,
                    height: 226,
                    constraints: BoxConstraints(
                      maxWidth: 380,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(containerBackground),
                        fit: BoxFit.cover,
                      ),
                      //color: containerColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(2, 20, 2, 4),
                          child: Text(
                            healthRemarks1,
                            style: CustomTheme.bodyText1.override(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          healthRemarks2,
                          style: CustomTheme.bodyText1.override(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 23, 0, 0),
                          child: Text(
                            '$immuneNumber',
                            style: CustomTheme.bodyText1.override(
                              fontFamily: 'Lilita One',
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Check Points',
                  style: CustomTheme.bodyText1.override(
                    fontFamily: 'Inter',
                    color: Color(0xFF333B5E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Text(
                  '1. It Seems Like you are Ticking most of the right boxes when it comes to maintaining good Health.',
                  style: CustomTheme.bodyText1.override(
                    fontFamily: 'Inter',
                    color: Color(0xFF6E6F71),
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text(
                  '2. Some peaceful breathing exercises or relaxation exercises done on a regular basis will help you to wind down.',
                  style: CustomTheme.bodyText1.override(
                    fontFamily: 'Inter',
                    color: Color(0xFF6E6F71),
                    fontSize: 16,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    'Recommendations',
                    style: CustomTheme.bodyText1.override(
                      fontFamily: 'Inter',
                      color: Color(0xFF333B5E),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            print("Container clicked");
                          },
                          child: Container(
                            width: 95,
                            height: 95,
                            decoration: BoxDecoration(
                              color: Color(0xFF51A7FA),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(
                                'Breathing\nExercise',
                                textAlign: TextAlign.center,
                                style: CustomTheme.bodyText1.override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF0B0B0B),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 60, 2, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment(0, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 1, 50, 0),
                              child: GestureDetector(
                                onTap: () {
                                  print("Container clicked");
                                },
                                child: Container(
                                  width: 95,
                                  height: 95,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF51A7FA),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    child: Text(
                                      'Immunity\nExercise',
                                      textAlign: TextAlign.center,
                                      style: CustomTheme.bodyText1.override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF0B0B0B),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(50, 1, 0, 0),
                              child: GestureDetector(
                                onTap: () {
                                  print("Container clicked");
                                },
                                child: Container(
                                  width: 95,
                                  height: 95,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF51A7FA),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    child: Text(
                                      'Water\nExercise',
                                      textAlign: TextAlign.center,
                                      style: CustomTheme.bodyText1.override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF0B0B0B),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
