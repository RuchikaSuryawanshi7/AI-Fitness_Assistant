import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/models/userModel.dart';
import 'package:fitness_app/pages/home_pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedInWithGmail=false;
  final GoogleSignIn googleSignIn=GoogleSignIn();
  late SharedPreferences sharedPreferences;
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  bool loggedInWithEmail=false;
  String? email,password;

  @override
  void initState() {
    isSignedIn();
    super.initState();
  }

  isSignedIn()async
  {
    sharedPreferences=await SharedPreferences.getInstance();
    isLoggedInWithGmail=await googleSignIn.isSignedIn();
    if(isLoggedInWithGmail)
    {
      User? user=FirebaseAuth.instance.currentUser;
      DocumentSnapshot doc= await usersReference.doc(user?.uid).get();
      currentUser=UserModel.fromDocument(doc);
    }
    else
    {

      loggedInWithEmail = sharedPreferences.getBool('loggedIn') ?? false;
      email=sharedPreferences.getString("email")??null;
      password=sharedPreferences.getString("password")??null;
      if(loggedInWithEmail) {
        await signIn();
        await sharedPreferences.setString('email', email.toString());
        await sharedPreferences.setString('password', password.toString());
        await sharedPreferences.setBool('loggedIn', true);
      }
    }
    Get.to(() => HomePage());
  }

  Future signInWithEmailAndPassword(String? email, String? password) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(email: email.toString(), password: password.toString());
      User? user = credential.user;
      return user?.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  signIn() async {
    await signInWithEmailAndPassword(
        email, password)
        .then((result) async {
      if (result != null)  {
        DocumentSnapshot documentSnapshot=await usersReference.doc(result).get();
        currentUser=UserModel.fromDocument(documentSnapshot);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ClipRRect(
              child: Image.asset("assets/images/logo.png",width: MediaQuery.of(context).size.width*0.5,),
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
          ),
        ],
      ),
    );
  }
}