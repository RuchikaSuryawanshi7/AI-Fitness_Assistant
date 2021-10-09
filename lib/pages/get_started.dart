import 'package:fitness_app/routes/app_pages.dart';
import 'package:fitness_app/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Image(
                  image: AssetImage(
                    "assets/images/undraw_yoga_248n1.png",
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Congratulations!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "You have access to unlimited workouts routines & diet plans.",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              AuthButton(
                text: "Get Started",
                onPressed: ()  => Get.offNamed(Routes.HOME),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
