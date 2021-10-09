import 'package:fitness_app/pages/home_pages/diet/explore_diet_plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dietCards.dart';

class DietPlans extends StatelessWidget {
  DietPlans({Key? key}) : super(key: key);
  final List<String> planNames = [
    'Immunity in Covid',
    'Blood Pressure',
    'Heart Problem',
    'Blood Sugar',
    'Joint Pain',
    'Back Pain',
    'Knee Pain',
    'Belly Fat',
    'Weight Gain',
    'Weight Loss',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 15),
                child: Text(
                  'Diet',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 4),
                child: Text(
                  'Plans',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: planNames.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: ()=>Get.to(DietCategory(category: planNames[index],)),
                    child: DietCard(
                      healthName: planNames[index],
                      healthDescription: '',
                      imagePath: 'assets/images/${planNames[index]}.jpg',
                      buttonName: 'Explore',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



