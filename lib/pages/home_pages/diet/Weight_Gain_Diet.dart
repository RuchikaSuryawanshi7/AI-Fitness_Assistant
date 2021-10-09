import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/routes/app_pages.dart';
import 'package:get/get.dart';

class WeightGain extends StatefulWidget {
  @override
  _WeightGainState createState() => _WeightGainState();
}

class _WeightGainState extends State<WeightGain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.chevron_left,
            color: Color(0xFF333B5E),
            size: 27,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, bottom: 10, right: 20),
                child: Text(
                  "Weight Gain Diets",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto Slab',
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.BREAKFAST),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    height: 65,
                    constraints: BoxConstraints(
                      maxWidth: 450,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF5C54E2),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Breakfast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    height: 65,
                    constraints: BoxConstraints(
                      maxWidth: 450,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF5C54E2),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Lunch',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    height: 65,
                    constraints: BoxConstraints(
                      maxWidth: 450,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF5C54E2),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Dinner',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    height: 65,
                    constraints: BoxConstraints(
                      maxWidth: 450,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF5C54E2),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Snacks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
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
