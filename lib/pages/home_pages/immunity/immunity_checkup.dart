import 'package:fitness_app/models/question_model.dart';
import 'package:fitness_app/pages/home_pages/immunity/immunity_checkup_review.dart';
import 'package:fitness_app/widgets/tinder_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImmunityCheckupPage extends StatefulWidget {
  const ImmunityCheckupPage({Key? key}) : super(key: key);

  @override
  _ImmunityCheckupPageState createState() => _ImmunityCheckupPageState();
}

class _ImmunityCheckupPageState extends State<ImmunityCheckupPage>
    with TickerProviderStateMixin {
  int value = 0;
  int currentQuestionIndex = 0;
  String currentQuestion = "";
  String currentAnswer = "";
  bool isDraggedLeftOrRight=true;

  late CardController controller;
  bool isActive = false;
  List<Question> listOfQuestions = [
    Question(
      question: "1.How Often do you fall Sick ?",
      answers: [
        "Often Fall sick a lot",
        "1-2 times a year",
        "Mostly when the weather Changes",
        "Never"
      ],
    ),
    Question(
      question: "2.Do you feel tired and Exhausted ?",
      answers: [
        "Tired and Exhausted throughout the day",
        "Normal, Neither Energetic nor Tired",
        "Energetic during the day, tired in evening",
        "Never, I am Always Energetic"
      ],
    ),
    Question(
      question: "3.Do you take Medicine Regularly ?",
      answers: [
        "Daily",
        "Sometimes",
        "Only when Consulted by Doctors",
        "Never"
      ],
    ),
    Question(
      question: "4.Do you Exercise Regularly ?",
      answers: [
        "Never",
        "One Time a Week",
        "More than 1 Time Every week",
        "Every Day"
      ],
    ),
    Question(
      question: "5.Do you take any immunity suppressing medicine ?",
      // "or having any Immunity suppressing Disease ?",
      answers: [
        "Yes",
        "Sometimes",
        "Not Really",
        "No",
      ],
    ),
    Question(
      question: "6.How well do you Sleep ?",
      answers: [
        "Disturbed Sleeping Pattern Throughout the Night",
        "Less than 4 hours a night",
        "Less than 6 hours a night",
        "Sound Sleep for 6 to 8 hours a night"
      ],
    ),
    Question(
      question: "7.How would you Describe your current stress Level ?",
      answers: [
        "High",
        "Average",
        "Low",
        "No stress at all",
      ],
    ),
    Question(
      question:
          "8.How would you rate your eating habits,is your diet balanced ?",
      // "and rich in vitamin and minerals ?",
      answers: [
        // "Bad Eating Habits - Eat unhealthy and junk outside food all the time.",
        "Bad Eating Habits",
        "Combination of Healthy food and Junk Food",
        "Average Eating Habit - Mix of Healthy Food",
        // "Great Eating Habits - Healthy food always, rarely eat junk food",
        "Great Eating Habits"
      ],
    ),
    Question(
      question: "9.Do you Suffer from Constipation ?",
      answers: [
        "Yes",
        "Sometimes",
        "Not often",
        "No",
      ],
    ),
    Question(
      question: "10.Do you Smoke ?",
      answers: [
        "Daily",
        "Few times a Week",
        "Few times a month",
        "Never",
      ],
    ),
  ];

  List<Map> review = [];

  Widget answerRow(BuildContext context, List<String> answers) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFE2E1EF),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: ListTile(
                onTap: () {
                  setState(() => value = index);
                },
                trailing: Radio(
                  activeColor: Color.fromRGBO(89, 97, 249, 1),
                  value: index,
                  groupValue: value,
                  onChanged: (val) => setState(() => value = val as int),
                ),
                title: Text(
                  answers.elementAt(index),
                  style: TextStyle(
                    color: Color.fromRGBO(63, 63, 67, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: answers.length,
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
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
    );
  }

  Widget progress(BuildContext context) {
    return SizedBox(
      width: 300,

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Answered $currentQuestionIndex/${listOfQuestions.length}',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                width: 350,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 0.25),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(89, 97, 249, 1),
                      Color.fromRGBO(238, 154, 229, 1),
                      Color.fromRGBO(238, 154, 229, 1),
                      Color.fromRGBO(238, 154, 229, 1),
                      Color.fromRGBO(238, 154, 229, 1),
                    ],
                  ),
                ),
              ),
              Container(
                width:
                    (currentQuestionIndex.toDouble() / listOfQuestions.length) *
                        250,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color.fromRGBO(250, 96, 82, 0.75),
                      Color.fromRGBO(250, 82, 152, 1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget nextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(89, 97, 249, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        onPressed: () {
          isDraggedLeftOrRight=false;
          controller.triggerLeft();
          setState(() => currentQuestionIndex += 1);
          if (currentQuestionIndex == listOfQuestions.length) {
            Future.delayed(Duration(milliseconds: 1000), () {
              Get.to(() => ImmunityCheckupReviewPage(review: review));
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text(
            "NEXT",
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
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBar(context),
            progress(context),

            /// card swiper
            Stack(children: [
              isActive == false
                  ? Container(
                      height: size.height * 0.72,
                      child: new TinderSwapCard(
                        swipeUp: false,
                        swipeDown: false,
                        orientation: AmassOrientation.bottom,
                        totalNum: listOfQuestions.length,
                        stackNum: 3,
                        swipeEdge: 4.0,
                        maxWidth: size.width * 0.85,
                        maxHeight: size.height * 0.65,
                        minWidth: size.width * 0.75,
                        minHeight: size.height * 0.6,
                        cardBuilder: (BuildContext context, int index) {
                          currentQuestion =
                              listOfQuestions.elementAt(index).question;
                          return Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 0,
                                        blurRadius: 30,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Align(
                                          alignment: Alignment(-1.7, 1),
                                          child: Container(
                                            width: size.width * 0.7,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xffad51a5),
                                                  Color(0xff5c54e2),
                                                ],
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                listOfQuestions
                                                    .elementAt(index)
                                                    .question,
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Inter',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    answerRow(
                                        context,
                                        listOfQuestions
                                            .elementAt(index)
                                            .answers),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        cardController: controller = CardController(),
                        swipeUpdateCallback:
                            (DragUpdateDetails details, Alignment align) {
                          /// Get swiping card's alignment
                          if (align.x < 0) {
                            //Card is LEFT swiping
                          } else if (align.x > 0) {
                            //Card is RIGHT swiping
                          }
                        },
                        swipeCompleteCallback:
                            (CardSwipeOrientation orientation, int index) {
                          /// Get orientation & index of swiped card!
                          // print(index);
                          if (isDraggedLeftOrRight &&(orientation == CardSwipeOrientation.left ||
                              orientation == CardSwipeOrientation.right)) {
                            setState(() => currentQuestionIndex += 1);
                            if (currentQuestionIndex == listOfQuestions.length) {
                              Future.delayed(Duration(milliseconds: 1000), () {
                                Get.to(() => ImmunityCheckupReviewPage(review: review));
                              });
                            }
                          }
                          isDraggedLeftOrRight=true;
                          if (orientation != CardSwipeOrientation.recover) {
                          setState(() {
                            currentAnswer = listOfQuestions
                                .elementAt(index)
                                .answers
                                .elementAt(value);
                            var p = listOfQuestions
                                .elementAt(index)
                                .points
                                .elementAt(value);
                            Map map = {
                              "que": currentQuestion,
                              "ans": currentAnswer,
                              "point": p
                            };
                            review.add(map);
                            // print(review);
                          });
                          }
                          if ((index + 1) == listOfQuestions.length) {
                            setState(() {
                              isActive = true;
                            });
                          }
                        },
                      ),
                    )
                  : Container(
                      height: size.height * 0.7,
                      child: Center(child: CircularProgressIndicator()),
                    ),
            ]),

            nextButton(context),
          ],
        ),
      ),
    );
  }
}
