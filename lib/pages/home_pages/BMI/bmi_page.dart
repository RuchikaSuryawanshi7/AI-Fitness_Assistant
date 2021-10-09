import 'dart:math';

import 'package:fitness_app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'horizontal_number_picker.dart';

class BMIPage extends StatefulWidget {
  BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  int value = 1;
  List<String> genders = ["Male", "Female", "Other"];

  String nameOfGender = "Male";
  int userAge = 28;
  int userHeight = 180;
  int userWeight = 60;
  double bmi = 0;

  double calculateBMI(int height, int weight, [int age = 15]) {
    return weight / pow(height / 100, 2);
  }

  void changeGender(String s) => setState(() => nameOfGender = s);

  void changeAge(int age) => setState(() => userAge = age);

  void changeHeight(int height) => setState(() => userHeight = height);

  void changeWeight(int weight) => setState(() => userWeight = weight);

  void chooseGender(BuildContext context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            height: 480,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 26,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Choose your gender",
                            style: TextStyle(
                              color: Color(0xff6e6f71),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          3,
                              (index) => SizedBox(
                            width: 150,
                            height: 40,
                            child: InkWell(
                              onTap: () => setState(() => value = index + 1),
                              child: Row(
                                children: [
                                  Radio(
                                    activeColor: Color.fromRGBO(89, 97, 249, 1),
                                    value: index + 1,
                                    groupValue: value,
                                    onChanged: (val) =>
                                        setState(() => value = val as int),
                                  ),
                                  Text(
                                    genders.elementAt(index),
                                    style: TextStyle(
                                      color: Color.fromRGBO(63, 63, 67, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color(0xFFF5F5F7),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          changeGender(genders.elementAt(value - 1));
                          Get.back();
                        },
                        icon: Text(
                          "Continue",
                          style: TextStyle(
                            color: Color(0xff5c54e2),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        label: Icon(
                          Icons.chevron_right,
                          color: Color(0xff5c54e2),
                        ),
                      ),
                      TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Color(0xff5c54e2),
                              fontSize: 14,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void chooseAge(BuildContext context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            height: 480,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 26,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Choose your age",
                            style: TextStyle(
                              color: Color(0xff6e6f71),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      HorizontalPicker(
                        minValue: 0,
                        maxValue: 100,
                        divisions: 100,
                        showCursor: false,
                        initialPosition: InitialPosition.center,
                        backgroundColor: Colors.transparent,
                        activeItemTextColor: Colors.black,
                        passiveItemsTextColor: Color(0xFFC7CAD6),
                        onChanged: (value) {
                          setState(() => userAge = value.toInt());
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color(0xFFF5F5F7),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          changeAge(userAge);
                          Get.back();
                        },
                        icon: Text(
                          "Continue",
                          style: TextStyle(
                            color: Color(0xff5c54e2),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        label: Icon(
                          Icons.chevron_right,
                          color: Color(0xff5c54e2),
                        ),
                      ),
                      TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Color(0xff5c54e2),
                              fontSize: 14,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void chooseHeight(BuildContext context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            height: 480,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Height",
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 26,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "In Centimetres",
                            style: TextStyle(
                              color: Color(0xff6e6f71),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      HorizontalPicker(
                        minValue: 120,
                        maxValue: 220,
                        divisions: 100,
                        showCursor: false,
                        initialPosition: InitialPosition.center,
                        backgroundColor: Colors.transparent,
                        activeItemTextColor: Colors.black,
                        passiveItemsTextColor: Color(0xFFC7CAD6),
                        onChanged: (value) {
                          setState(() => userHeight = value.toInt());
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color(0xFFF5F5F7),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          changeHeight(userHeight);
                          Get.back();
                        },
                        icon: Text(
                          "Continue",
                          style: TextStyle(
                            color: Color(0xff5c54e2),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        label: Icon(
                          Icons.chevron_right,
                          color: Color(0xff5c54e2),
                        ),
                      ),
                      TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Color(0xff5c54e2),
                              fontSize: 14,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void chooseWeight(BuildContext context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            height: 480,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                              color: Color(0xff151515),
                              fontSize: 26,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "In Kilograms",
                            style: TextStyle(
                              color: Color(0xff6e6f71),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      HorizontalPicker(
                        minValue: 40,
                        maxValue: 140,
                        divisions: 100,
                        showCursor: false,
                        initialPosition: InitialPosition.center,
                        backgroundColor: Colors.transparent,
                        activeItemTextColor: Colors.black,
                        passiveItemsTextColor: Color(0xFFC7CAD6),
                        onChanged: (value) {
                          setState(() => userWeight = value.toInt());
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color(0xFFF5F5F7),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          changeWeight(userWeight);
                          Get.back();
                        },
                        icon: Text(
                          "Continue",
                          style: TextStyle(
                            color: Color(0xff5c54e2),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        label: Icon(
                          Icons.chevron_right,
                          color: Color(0xff5c54e2),
                        ),
                      ),
                      TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Color(0xff5c54e2),
                              fontSize: 14,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Calculate BMI",
            style: TextStyle(
              color: Color(0xff151515),
              fontSize: 26,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 42),
          SizedBox(
            width: 316,
            height: 93,
            child: Text(
              "“Being defeated is only a temporary condition. Giving up is what makes it permanent.”",
              style: TextStyle(
                color: Color(0xff6e6f71),
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 42),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OutlinedButton(
                        onPressed: () => chooseGender(context),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                nameOfGender,
                                style: TextStyle(
                                  color: Color(0xff4a4c4b),
                                  fontSize: 18,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff4a4c4b),
                              )
                            ],
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Color(0xff858585),
                            width: 2,
                          ),
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 25,
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        color: Colors.white,
                        child: Text("Gender"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OutlinedButton(
                        onPressed: () => chooseAge(context),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                userAge.toString(),
                                style: TextStyle(
                                  color: Color(0xff4a4c4b),
                                  fontSize: 18,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff4a4c4b),
                              )
                            ],
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Color(0xff858585),
                            width: 2,
                          ),
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 25,
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        color: Colors.white,
                        child: Text("Age"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OutlinedButton(
                        onPressed: () => chooseHeight(context),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                userHeight.toString(),
                                style: TextStyle(
                                  color: Color(0xff4a4c4b),
                                  fontSize: 18,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff4a4c4b),
                              )
                            ],
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Color(0xff858585),
                            width: 2,
                          ),
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 25,
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        color: Colors.white,
                        child: Text("Height"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OutlinedButton(
                        onPressed: () => chooseWeight(context),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                userWeight.toString(),
                                style: TextStyle(
                                  color: Color(0xff4a4c4b),
                                  fontSize: 18,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff4a4c4b),
                              )
                            ],
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Color(0xff858585),
                            width: 2,
                          ),
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 25,
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        color: Colors.white,
                        child: Text("Weight"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 42),
          ElevatedButton(
            onPressed: () async {
              var bmiResult = calculateBMI(userHeight, userWeight);
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setDouble('BMIValue', bmiResult);
              Get.toNamed(Routes.BMI_RESULT,
                  arguments: {'bmiResult': bmiResult});
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xff5c54e2),
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            child: Text(
              "CALCULATE BMI",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}