import 'package:fitness_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIResult extends StatelessWidget {

  const BMIResult({Key? key, this.bmiResult = 18.1}) : super(key: key);

  final num bmiResult;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.HOME),
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'BMI Result',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Ruchika",
            style: TextStyle(
              color: Color(0xff151515),
              fontSize: 26,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 337,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 20,
                    offset: Offset(0, 0),
                  ),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Get.arguments['bmiResult'].toStringAsFixed(1) ??
                          bmiResult.toStringAsFixed(1),
                      style: TextStyle(
                        color: Color(0xff565869),
                        fontSize: 100,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      "HEY!!!",
                      style: TextStyle(
                        color: Color(0xff00d664),
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 7),
                    SizedBox(
                      width: 292,
                      height: 56,
                      child: Text(
                        "You can control many things on a healthy eating plan, but you’ll also need to be flexible. For example, if you don’t have all the ingredients to make the meal you were planning and have to eat out instead, choose a restaurant that offers some healthier options.",
                        style: TextStyle(
                          color: Color(0xff6e6f71),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(89, 97, 249, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
            onPressed: () => Get.toNamed(Routes.HOME),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "Save Result",
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
          )
        ],
      ),
    );
  }
}