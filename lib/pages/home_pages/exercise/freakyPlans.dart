import 'package:fitness_app/pages/home_pages/exercise/WeightLoss/WeightLossExercise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'freakyPlansCard.dart';

class FreakyPlans extends StatefulWidget {
  FreakyPlans({Key? key}) : super(key: key);

  @override
  _FreakyPlansState createState() => _FreakyPlansState();
}

class _FreakyPlansState extends State<FreakyPlans> {
  int index = 0;
  Map<String, List> poses = {
    'Weight Gain': [
      'Tadasana',
      'Pigeon Pose',
      'Cobra Pose',
      'Bow Pose',
      'Child Pose',
      'Plow Pose',
      'Viparita Krani'
    ],
    'Weight Loss': [
      'Tree Pose',
      'Triangle Pose',
      'Chair Pose',
      'Uttasana',
      'Bridge',
      'Viparitq Krani',
      'Child Pose',
      'Cobra Pose',
      'Plank'
    ],
    'Belly Fat': [
      'Tadasan',
      'Low Lungs',
      'Uttasana',
      'Cobra Pose',
      'Bow Pose',
      'Cat Stratch',
      'Plank'
    ],
    'Knee Pain': [
      'Tree Pose',
      'Low Lungs',
      'Camel Pose',
      'Cobra Pose',
      'Child Pose',
      'Plank'
    ],
    'Back Pain': [
      'Tadasana',
      'Triangle Pose',
      'Pigeon Pose',
      'Cobra Pose',
      'Bow Pose',
      'Gomukhasana'
    ],
    'Joint Pain': [
      'Child Pose',
      'Cat Stretch',
      'Bow Pose',
      'Fish Pose',
      'Viparita Krani',
      'Tree Pose'
    ],
    'Blood Sugar': [
      'Tadasan',
      'Plank',
      'Child Pose',
      'Gomukhasana',
      'Mandukhasana',
      'Viparita Krani'
    ],
    'Blood Pressure': [
      'Tree Pose',
      'Triangle Pose',
      'Chair Pose',
      'Dolphin Pose',
      'Cobra Pose',
      'Plank'
    ],
    'Heart Problem': [
      'Low lungs',
      'Pigeon Pose',
      'Seated Forward',
      'Vajrasana',
      'Lotus Pose'
    ],
    'Weak Immunity': [
      'Tree Pose',
      'Chakrasana',
      'Viparita Karani',
      'Plow Pose',
      'Cobra pose'
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Freaky Plans",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 23,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: index == 0
                            ? MaterialStateProperty.all(Color(0xff51A7FA))
                            : MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () => setState(() => index = 0),
                      child: Text('Get in shape'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: index == 1
                            ? MaterialStateProperty.all(Color(0xff51A7FA))
                            : MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () => setState(() => index = 1),
                      child: Text('Fix pains'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor: index == 2
                            ? MaterialStateProperty.all(Color(0xff51A7FA))
                            : MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Text('Health problems'),
                    ),
                  ],
                ),
              ),
            ),
            index == 1
                ? Column(
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(WeightLossExercises(
                          poses: poses['Knee Pain'],
                        )),
                        child: FreakyPlansCard(
                          healthName: 'Knee Pain',
                          healthDescription: 'Scientific methods',
                          imagePath: 'assets/images/kneepain.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(WeightLossExercises(
                          poses: poses['Back Pain'],
                        )),
                        child: FreakyPlansCard(
                          healthName: 'Back Pain',
                          healthDescription: 'Scientific methods',
                          imagePath: 'assets/images/backpain.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(WeightLossExercises(
                          poses: poses['Joint Pain'],
                        )),
                        child: FreakyPlansCard(
                          healthName: 'Joint Pain',
                          healthDescription: 'Scientific methods',
                          imagePath: 'assets/images/jointpain.png',
                        ),
                      ),
                    ],
                  )
                : index == 0
                    ? Column(
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(WeightLossExercises(
                              poses: poses['Weight Loss'],
                            )),
                            child: FreakyPlansCard(
                              healthName: 'Weight Loss',
                              healthDescription: 'Scientific methods',
                              imagePath: 'assets/images/weightloss.png',
                              //  cardColor: Color(0xFFF752FA).withOpacity(0.3)
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(WeightLossExercises(
                              poses: poses['Weight Gain'],
                            )),
                            child: FreakyPlansCard(
                              healthName: 'Weight Gain',
                              healthDescription: 'Scientific methods',
                              imagePath: 'assets/images/weightgain.png',
                              // cardColor: Color(0xFFFAA352).withOpacity(0.3)
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(WeightLossExercises(
                              poses: poses['Belly Fat'],
                            )),
                            child: FreakyPlansCard(
                              healthName: 'Belly Fat',
                              healthDescription: 'Scientific methods',
                              imagePath: 'assets/images/bellyfat.png',
                              // cardColor: Color(0xFF55FA52).withOpacity(0.3)
                            ),
                          ),
                        ],
                      )
                    : index == 2
                        ? Column(
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(WeightLossExercises(
                                  poses: poses['Blood Sugar'],
                                )),
                                child: FreakyPlansCard(
                                  healthName: 'Blood Sugar',
                                  healthDescription: 'Scientific methods',
                                  imagePath: 'assets/images/bloodsugar.png',
                                  //   cardColor: Color(0xFFF752FA).withOpacity(0.3)
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.to(WeightLossExercises(
                                  poses: poses['Heart Problem'],
                                )),
                                child: FreakyPlansCard(
                                  healthName: 'Heart Problem',
                                  healthDescription: 'Scientific methods',
                                  imagePath: 'assets/images/heartproblem.png',
                                  //  cardColor: Color(0xFFFAA352).withOpacity(0.3)
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.to(WeightLossExercises(
                                  poses: poses['Blood Pressure'],
                                )),
                                child: FreakyPlansCard(
                                  healthName: 'Blood Pressure',
                                  healthDescription: 'Scientific methods',
                                  imagePath: 'assets/images/bloodpressure.png',
                                  //    cardColor: Color(0xFF55FA52).withOpacity(0.3)
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.to(WeightLossExercises(
                                  poses: poses['Weak Immunity'],
                                )),
                                child: FreakyPlansCard(
                                  healthName: 'Weak Immunity',
                                  healthDescription: 'Scientific methods',
                                  imagePath: 'assets/images/weakimmunity.png',
                                  //  cardColor: Color(0xFFA352FA).withOpacity(0.3)
                                ),
                              ),
                            ],
                          )
                        : Text(''),
          ],
        ),
      ),
    );
  }
}
