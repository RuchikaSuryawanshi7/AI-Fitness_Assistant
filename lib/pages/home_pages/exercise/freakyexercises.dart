
import 'package:fitness_app/pages/home_pages/exercise/watchVideoCard.dart';
import 'package:flutter/material.dart';

class FreakyExercises extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
        title: Text(
          "Weight Loss Exercises",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WatchVideoCard(),
            WatchVideoCard(),
            WatchVideoCard(),
          ],
        ),
      ),
    );
  }
}
