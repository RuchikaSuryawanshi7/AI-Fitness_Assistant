import 'dart:convert';
import 'dart:core';

import 'package:fitness_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teachable/teachable.dart';
import 'package:timer_builder/timer_builder.dart';

class YogaAi extends StatefulWidget {
  const YogaAi({Key? key, required this.poseName}) : super(key: key);
  final String poseName;

  @override
  _YogaAiState createState() => _YogaAiState();
}

class _YogaAiState extends State<YogaAi> {
  String username = "Ruchika Suryawanshi";
  final TextEditingController _controller = TextEditingController();
  final _flutterTts = FlutterTts();
  late DateTime alert;
  String pose = "";
  double accuracy = 0.0;
  double result = 0.0;
  String acc = "";

  @override
  void initState() {
    super.initState();

    alert = DateTime.now().add(Duration(minutes: 1));
  }

  void speak(String command) async {
    if (_controller.text.isNotEmpty) {
      await _flutterTts.speak(command);
    }
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  void countdown(String delay) async {
    if (delay == "00:55") {
      final _flutterTts = FlutterTts();
      _flutterTts.speak("Keep your phone Stable and Stand infront of it");
    } else if (delay == "00:40") {
      final _flutterTts = FlutterTts();
      _flutterTts.speak(
          "If you can see yourself doing something, you can do it. If you ca' see yourself doing it, usually you ca' achieve it.");
    } else if (delay == "00:30") {
      final _flutterTts = FlutterTts();
      _flutterTts.speak(
          " The nature of yoga is to shine the light of awareness into the darkest corners of the body.");
    } else if (delay == "00:10") {
      final _flutterTts = FlutterTts();
      _flutterTts.speak(" Your very close to complete your Yoga Pose");
    } else if (delay == "00:03") {
      final _flutterTts = FlutterTts();
      _flutterTts.speak("Yeah!! Congratulation, you are done");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.deepPurple,
            automaticallyImplyLeading: true,
            title: Text(
              'Freak AI Pose Estimation',
              style: CustomTheme.title3.override(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: Colors.white,
                  size: 17,
                ),
                onPressed: () {
                  _flutterTts.speak(
                      "$username.You are not completely visible in Camera");
                },
              )
            ],
            centerTitle: true,
            elevation: 0,
          ),
          body: Stack(
            children: [
              Container(
                  child: Column(children: <Widget>[
                Container(
                  height: 80.0,
                  child: TimerBuilder.scheduled([alert], builder: (context) {
                    // This function will be called once the alert time is reached
                    var now = DateTime.now();
                    var reached = now.compareTo(alert) >= 0;
                    final textStyle = Theme.of(context).textTheme.headline6;
                    var remaining;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                reached
                                    ? "assets/images/exercise.png"
                                    : "assets/images/runner.png",
                                height: 60.0,
                                width: 60.0,
                              ),
                              !reached
                                  ? TimerBuilder.periodic(Duration(seconds: 1),
                                      alignment: Duration.zero,
                                      builder: (context) {
                                      // This function will be called every second until the alert time
                                      var now = DateTime.now();
                                      remaining = alert.difference(now);
                                      String c = formatDuration(remaining);
                                      countdown(c);

                                      return Text(
                                        formatDuration(remaining),
                                        style: textStyle,
                                      );
                                    })
                                  : Text("Yoga Completed", style: textStyle),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0.0),
                                ),
                                onPressed: () {
                                  final _flutterTts = FlutterTts();
                                  _flutterTts.speak(
                                      "$username. Are you ready for your Yoga session?");
                                  setState(() {
                                    alert = DateTime.now()
                                        .add(Duration(minutes: 1));
                                    //speak("command");
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Colors.deepPurple,
                                        Colors.purpleAccent,
                                      ],
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text('  Start   ',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                Expanded(
                  child: Container(
                    child: Teachable(
                      path: "pose/main.html",
                      results: (res) {
                        var resp = jsonDecode(res);
                        print(resp);
                        // print("The values are ${}");
                        setState(() {
                          //get the string value of accuracy
                          pose = (resp[widget.poseName] * 100.0).toString();
                          //covert it to double
                          result = double.parse(pose);
                          //Rounding the value of accuracy
                          accuracy = double.parse(result.toStringAsFixed(2));
                          acc = accuracy.toString();

                          // 2.123
                        });
                      },
                    ),
                  ),
                ),
              ])),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/fit.png",
                              height: 60.0,
                              width: 60.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Bound Angle Pose".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17.0),
                              ),
                            ),
                            Container(
                              //height: 10.0,
                              width: 15.0,
                            ),
                            Image.asset(
                              "assets/images/heart.png",
                              height: 60.0,
                              width: 60.0,
                            ),
                            Container(
                              height: 10.0,
                              width: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: Text(
                                acc,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              )
            ],
          )),
    );
  }
}

String formatDuration(Duration d) {
  String f(int n) {
    return n.toString().padLeft(2, '0');
  }

  // We want to round up the remaining time to the nearest second
  d += Duration(microseconds: 999999);
  return "${f(d.inMinutes)}:${f(d.inSeconds % 60)}";
}
