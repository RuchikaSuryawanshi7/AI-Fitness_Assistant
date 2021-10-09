import 'package:fitness_app/routes/app_pages.dart';
import 'package:fitness_app/widgets/custom_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

int optionsCount = 1;

class Preference extends StatefulWidget {
  @override
  _PreferenceState createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  int totalOptionSelected = 0;
  List selectedItems = [];
  List<bool> selectedBool = [];
  List<Color> selectedFontColor = [];

  final List<String> planNames = [
    'Increase Immunity',
    'Heart Problem',
    'Blood Pressure',
    'Blood Sugar',
    'Knee Pain',
    'Back Pain',
    'Joint Pain',
    'Weight Loss',
    'Weight Gain',
    'Belly Fat',
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < planNames.length; i++) {
      selectedBool.add(false);
      selectedFontColor.add(Color(0xff5c54e2));
    }
  }

  void onFilterChipSelected(bool val, int index) {
    setState(() {
      if (totalOptionSelected < 3) {
        selectedBool[index] = val;
        if (selectedBool[index] = val) {
          selectedFontColor[index] = Colors.white;
          selectedItems.add(planNames.elementAt(index));
          totalOptionSelected++;
        } else {
          selectedFontColor[index] = Color(0xff5c54e2);
          selectedItems.remove(planNames.elementAt(index));
          totalOptionSelected--;
        }
      } else if (selectedBool[index] == true) {
        selectedBool[index] = false;
        selectedFontColor[index] = Color(0xff5c54e2);
        selectedItems.remove(planNames.elementAt(index));
        totalOptionSelected--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select Your Preference",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "You must select three topics",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 35),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: 4,
                  children: List.generate(
                    planNames.length,
                    (index) => CustomChip(
                      label: planNames.elementAt(index),
                      onSelected: (val) => onFilterChipSelected(val, index),
                      isSelected: selectedBool[index],
                      fontColor: selectedFontColor[index],
                    ),
                  ),
                ),
                SizedBox(height: 80),
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff5c54e2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Color(0xff5c54e2)),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.offNamed(Routes.HOME);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    child: Text(
                      "GET STARTED",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
