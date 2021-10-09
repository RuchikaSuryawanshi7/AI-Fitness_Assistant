import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_app/controllers/auth_controllers.dart';
import 'package:fitness_app/models/userModel.dart';
import 'package:fitness_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_strategy/url_strategy.dart';

import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Permission.camera.request();
  await Permission.microphone.request();
  await GetStorage.init();
  Get.put<AuthController>(AuthController());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    setPathUrlStrategy();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Loading(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fitness App',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Inter'),
          getPages: AppPages.routes,
          unknownRoute: AppPages.unknownPage,
        ),
      );
    });
  }
}

//variables for auth and saving data to backend
UserModel? currentUser;
final Reference usersStorageReference =
    FirebaseStorage.instance.ref().child("Users");
final usersReference = FirebaseFirestore.instance.collection('users');
final tipsReference = FirebaseFirestore.instance.collection('tips');
final dietPlan = FirebaseFirestore.instance.collection('dietPlan');
final plans = FirebaseFirestore.instance.collection('plans');
