import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/helpers/dialogs.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/models/userModel.dart';
import 'package:fitness_app/routes/app_pages.dart';
import 'package:fitness_app/widgets/auth_button.dart';
import 'package:fitness_app/widgets/google_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeSignUp extends StatefulWidget {
  const WelcomeSignUp({Key? key}) : super(key: key);

  @override
  _WelcomeSignUpState createState() => _WelcomeSignUpState();
}

class _WelcomeSignUpState extends State<WelcomeSignUp> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool loading = false;

  Future handleSignInForGoogle() async {
    setState(() {
      loading = true;
    });
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(credential);
    final User? user = userCredential.user;
    if (user != null) {
      final QuerySnapshot snapshot =
          await usersReference.where('id', isEqualTo: user.uid).get();
      List<DocumentSnapshot> document = snapshot.docs;
      if (document.length == 0) {
        usersReference.doc(user.uid).set({
          "id": user.uid,
          "username": user.displayName,
          "url": user.photoURL,
          "email": user.email,
        });
        DocumentSnapshot documentSnapshot =
            await usersReference.doc(user.uid).get();
        currentUser = UserModel.fromDocument(documentSnapshot);
      } else {
        currentUser = UserModel.fromDocument(document[0]);
      }
      setState(() {
        loading = false;
      });
      Get.toNamed("/getStarted");
    } else {
      showToast('Login failed!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image(
                              image: AssetImage('assets/images/Rectangle5.png'),
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.6,
                              // colorBlendMode: ,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(bottom: 45),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 165,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0x00ffffff),
                                    Color(0x0cffffff),
                                    Colors.white
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Positioned(
                          bottom: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Freak",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "By creating an account you get access to an \n"
                                    "unlimited number of exercises and plans",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GoogleButton(
                    text: "Sign up with Google",
                    onPressed: () => handleSignInForGoogle()),
                AuthButton(
                  text: "Sign up with Email",
                  onPressed: () => Get.toNamed(Routes.SIGN_UP),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already a member? "),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.SIGN_IN),
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            loading ? Center(child: CircularProgressIndicator()) : Container(),
          ],
        ),
      ),
    );
  }
}
