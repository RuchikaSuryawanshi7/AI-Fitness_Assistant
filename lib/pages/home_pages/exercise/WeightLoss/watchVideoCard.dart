import 'dart:ui';

import 'package:fitness_app/pages/home_pages/exercise/ExerciseInfo.dart';
import 'package:fitness_app/pages/home_pages/exercise/aiYoga/yoga_ai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatchVideoCard extends StatelessWidget {
  final String? poseName;
  final String? poseHeading;

  const WatchVideoCard({Key? key, this.poseName, this.poseHeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 5,
      ),
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/Rectangle 104.png',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => Get.to(
                    ExerciseTutorialPage(
                      videoUrl:
                          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
                      description:
                          '''Physical activity or exercise can improve your health and reduce the risk of developing several diseases like type 2 diabetes, cancer and cardiovascular disease. Physical activity and exercise can have immediate and long-term health benefits. Most importantly, regular activity can improve your quality of life.''',
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        alignment: Alignment.center,
                        color: Colors.white.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Watch Tutorial",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      height: 50,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // color: Colors.white.withOpacity(0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            poseHeading!,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(YogaAi(poseName: poseName!)),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white,
                              ),
                              child: Text("Start Now"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
