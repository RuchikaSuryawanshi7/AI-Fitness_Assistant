import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/pages/home_pages/exercise/WeightLoss/watchVideoCard.dart';
import 'package:flutter/material.dart';

class WeightLossExercises extends StatelessWidget {
  final List? poses;
  final String? heading;
  WeightLossExercises({Key? key,this.poses,this.heading}) : super(key: key);

  String returnPoseName(String poseName){
    switch (poseName) {
      case 'Cat Stretch':
        return 'Cat Stretch';
      case 'Chair Pose':
        return 'Chair Pose';
      case 'Chakrasana':
        return 'Chakrasana';
      case 'Child Pose':
        return 'Child Pose';
      case 'Cobra Pose':
        return 'Cobra pose';
      case 'Dolphin Pose':
        return 'Dolphin pose';
      case 'Downward Facing Dog':
        return 'Downward-Facing Dog';
      case 'Fish Pose':
        return 'fish pose';
      case 'Gomukhasana':
        return 'Gomukhasana';
      case 'Knee to Chest':
        return 'knee to chest';
      case 'Lotus pose':
        return 'lotus pose';
      case 'Low Lungs':
        return 'low lungs';
      case 'Mandukhasana':
        return 'Mandukasana';
      case 'Pigeon Pose':
        return 'Pigeon Pose';
      case 'Plank':
        return 'plank';
      case 'Revolved head of knee':
        return 'Revolved Head-of-the-Knee Pose';
      case 'Salamba Shrishasana':
        return 'Salamba Shirshasana';
      case 'Seated Forward Fold':
        return 'seated forward fold';
      case 'Seated Spinal Twist':
        return 'Seated Spinal Twist';
      case 'Tadasana':
        return 'tadasan';
      case 'Plow Pose':
        return 'The Plow Pose';
      case 'Tree Pose':
        return 'tree pose';
      case 'Triangle Pose':
        return 'Triangle Pose';
      case 'Uttasana':
        return 'Uttanasana';
      case 'Vajrasana':
        return 'Vajrasana';
      case 'Viparita Karani':
        return 'Viparita Karani';
      case 'Viparita Shabasana':
        return 'viparita shalabhasana';
      case 'Warrior-1':
        return 'warrior 1';
      case 'Bound Angle Pose':
        return 'Bound Angle Pose';
      case 'Bow Pose':
        return 'Bow pose';
      case 'Bridge':
        return 'Bridge Pose';
      case 'Camel Pose':
        return 'Camel pose';
      default:
        return 'no pose exists';
    }
  }
  void updatePlan()async{
    if(currentUser!=null)
      {
        await plans.doc(currentUser!.id).set({
          'plans':FieldValue.arrayUnion(
            [
              {
                'planName': heading,
                'timeStamp': DateTime.now(),
              }
            ]
          ),
        },SetOptions(merge: true));
      }
  }

  @override
  Widget build(BuildContext context) {
    updatePlan();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
        title: Text(
          "Exercises",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: poses!.length,
        itemBuilder: (context,index){
          return WatchVideoCard(poseHeading: poses![index],poseName: returnPoseName(poses![index]),);
        },
      ),
    );
  }
}
