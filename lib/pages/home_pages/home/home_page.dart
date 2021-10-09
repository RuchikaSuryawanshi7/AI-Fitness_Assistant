import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/controllers/auth_controllers.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/pages/auth_pages/welcome_sign_in.dart';
import 'package:fitness_app/pages/home_pages/Readings/TipsCategory.dart';
import 'package:fitness_app/pages/home_pages/Readings/freakyTips.dart';
import 'package:fitness_app/pages/home_pages/chatbot/chatbot.dart';
import 'package:fitness_app/pages/home_pages/diet/dietCards.dart';
import 'package:fitness_app/pages/home_pages/diet/diet_plan.dart';
import 'package:fitness_app/pages/home_pages/diet/explore_diet_plan.dart';
import 'package:fitness_app/pages/home_pages/exercise/freakyPlans.dart';
import 'package:fitness_app/pages/home_pages/exercise/freakyPlansCard.dart';
import 'package:fitness_app/pages/home_pages/nav_bar.dart';
import 'package:fitness_app/pages/home_pages/profile/profile.dart';
import 'package:fitness_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../assessmentCard.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("My Profile", Icons.person_outline),
    new DrawerItem("Diet Plans", Icons.people_outline)
  ];
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

  _onSelectItem(int index, BuildContext context) {
    Navigator.pop(context);
    if (index == 0) {
      Navigator.pop(context);
      Get.to(HomePage());
    } else if (index == 1)
      Get.to(ProfilePage());
    else if (index == 2) Get.to(() => DietPlans());
  }

  void logOutDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Are you sure you want to log out?'),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xffd4a034),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            'Yes',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
            logoutUser(context);
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xffd4a034),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            'No',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  logoutUser(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    bool isLoggedInWithGmail = await googleSignIn.isSignedIn();
    if (isLoggedInWithGmail) {
      googleSignIn.signOut();
      _auth.signOut();
    } else
      signOut();
    currentUser = null;
    Get.offAll(HomePage());
  }

  Future signOut() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('loggedIn', false);
      preferences.setString('email', 'null');
      preferences.setString('password', 'null');
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  List<Widget> _buildScreens() {
    return [
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  currentUser != null ? currentUser!.username! : 'User',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 23,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                actions: [
                  InkWell(
                    onTap: () => Get.toNamed(Routes.PROFILE),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Image.asset('assets/images/profile.png'),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Let's get Exercise",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Plans',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.FREAKY_PLANS),
                      child: Text(
                        'See all',
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(FreakyTips(heading: 'Weight Loss')),
                      child: FreakyPlansCard(
                        healthName: 'Weight Loss',
                        healthDescription: 'Scientific methods',
                        imagePath: 'assets/images/weightloss.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(FreakyTips(heading: 'Weight Gain')),
                      child: FreakyPlansCard(
                        healthName: 'Weight Gain',
                        healthDescription: 'Scientific methods',
                        imagePath: 'assets/images/weightgain.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(FreakyTips(heading: 'Belly Fat')),
                      child: FreakyPlansCard(
                        healthName: 'Belly Fat',
                        healthDescription: 'Scientific methods',
                        imagePath: 'assets/images/bellyfat.png',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Diet',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () => Get.to(() => DietPlans()),
                      child: Text(
                        'See all',
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () =>
                        Get.to(DietCategory(category: planNames[index])),
                    child: DietCard(
                      healthName: planNames[index],
                      healthDescription: '',
                      imagePath: 'assets/images/${planNames[index]}.jpg',
                      buttonName: 'Explore',
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tips',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextButton(
                        onPressed: () => Get.to(() => TipsCategory()),
                        child: Text(
                          'See all',
                        ))
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  FreakyPlansCard(
                    healthName: 'Immunity in COVID',
                    healthDescription: '',
                    imagePath: 'assets/images/weakimmunity.png',
                    buttonName: 'Read now',
                  ),
                  FreakyPlansCard(
                    healthName: 'Immunity in COVID',
                    healthDescription: '',
                    imagePath: 'assets/images/weakimmunity.png',
                    buttonName: 'Read now',
                  ),
                  FreakyPlansCard(
                    healthName: 'Immunity in COVID',
                    healthDescription: '',
                    imagePath: 'assets/images/weakimmunity.png',
                    buttonName: 'Read now',
                  ),
                ]),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Assessments',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                            onTap: () => Get.toNamed(Routes.BMI),
                            child: AssessmentCard(assessmentCardName: "BMI")),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () => Get.toNamed(Routes.IMMUNITY_CHECKUP),
                            child:
                                AssessmentCard(assessmentCardName: "Immunity")),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
      FreakyPlans(),
      ChatBot(),
      DietPlans(),
      ProfilePage(),
    ];
  }

  Widget customDrawer(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(
            d.icon,
            color: Colors.deepPurple,
          ),
          title: new Text(
            d.title,
            style: TextStyle(color: Colors.deepPurple),
          ),
          onTap: () => _onSelectItem(i, context),
        ),
      );
    }
    return Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                currentUser != null ? currentUser!.username! : 'User',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                image: DecorationImage(
                    image: AssetImage("assets/images/freaklogo.png"),
                    fit: BoxFit.cover)),
          ),
          currentUser == null
              ? GestureDetector(
                  onTap: () => Get.offAll(() => WelcomeSignIn()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "SignIn",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text(
                        "SignUp",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () => logOutDialog(context),
                  child: Text(
                    "Log Out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
          Divider(),
          new Column(children: drawerOptions),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => controller.firestoreUser.value?.isBlank == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white,
              drawer: customDrawer(context),
              body: CustomNavBar(screens: _buildScreens()),
            ),
    );
  }
}
