import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/constant/theme.dart';
import 'package:fitness_app/controllers/auth_controllers.dart';
import 'package:fitness_app/helpers/dialogs.dart';
import 'package:fitness_app/helpers/validator.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/models/userModel.dart';
import 'package:fitness_app/routes/app_pages.dart';
import 'package:fitness_app/widgets/auth_button.dart';
import 'package:fitness_app/widgets/custom_textfield.dart';
import 'package:fitness_app/widgets/password_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isConfirmObscure = true;
  bool _isPasswordObscure = true;
  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences sharedPreferences;
  bool loading = false;
  bool isLoggedIn = false;

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          showToast("This email doesn't exist.");
          break;
        case "wrong-password":
          showToast("Incorrect password!!");
          break;
        case "user-not-found":
          showToast("No user exist with this email");
          break;
        case "user-disabled":
          showToast("Your account has been disabled");
          break;
        case "operation-not-allowed":
          showToast("Please try again later. Requested several times");
          break;
        case "operation-not-allowed":
          showToast("This operation is not allowed");
          break;
        case "email-already-in-use":
          showToast("This email has already been taken");
          break;
        default:
          showToast("Check your network connection. And try again later");
      }
      return null;
    }
  }

  signUpWithEmail() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      await signUpWithEmailAndPassword(email, password).then((result) async {
        if (result != null) {
          usersReference.doc(result.user.uid).set({
            "id": result.user!.uid,
            "username": name,
            "url": '',
            "email": email,
          }).catchError((error) => print(error));
          sharedPreferences = await SharedPreferences.getInstance();
          await sharedPreferences.setString('email', email);
          await sharedPreferences.setString('password', password);
          await sharedPreferences.setBool('loggedIn', true);
          DocumentSnapshot documentSnapshot =
              await usersReference.doc(result.user.uid).get();
          currentUser = UserModel.fromDocument(documentSnapshot);
          Get.toNamed("/getStarted");
        }
      });
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Freak",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "One step away",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              // color: AllColours.skyBlue,
                            ),
                          ),
                          Text(
                            "from your",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "Dream Physique",
                            style: TextStyle(
                              fontSize: 30,
                              color: CustomTheme.skyBlue,
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.loose,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextField(
                              controller: authController.nameController,
                              iconData: Icons.person_outline,
                              hintText: "Enter your full name",
                              onChanged: (val) => null,
                              onSaved: (val) =>
                                  authController.nameController.text = val!,
                              validator: Validator().name,
                            ),
                            CustomTextField(
                              controller: authController.emailController,
                              iconData: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              hintText: "Enter your email",
                              onChanged: (val) => null,
                              onSaved: (val) =>
                                  authController.emailController.text = val!,
                              validator: Validator().email,
                            ),
                            PasswordTextField(
                              controller: authController.passwordController,
                              onChanged: (val) => null,
                              onSaved: (val) =>
                                  authController.passwordController.text = val!,
                              validator: Validator().password,
                              obscureText: _isPasswordObscure,
                              hintText: "Enter your password",
                              suffixIcon: IconButton(
                                icon: Icon(!_isPasswordObscure
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: () => setState(() =>
                                    _isPasswordObscure = !_isPasswordObscure),
                              ),
                            ),
                            PasswordTextField(
                              controller:
                                  authController.confirmPasswordController,
                              onChanged: (val) => null,
                              onSaved: (val) => authController
                                  .confirmPasswordController.text = val!,
                              validator: Validator().password,
                              obscureText: _isConfirmObscure,
                              hintText: "Confirm your password",
                              suffixIcon: IconButton(
                                icon: Icon(!_isConfirmObscure
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: () => setState(() =>
                                    _isConfirmObscure = !_isConfirmObscure),
                              ),
                            ),
                            SizedBox(height: 50),
                            AuthButton(
                              text: "Sign Up",
                              // onPressed: () => signUpWithEmail(),
                              onPressed: () async{
                                if (_formKey.currentState!.validate()) {
                                  SystemChannels.textInput.invokeMethod(
                                      'TextInput.hide'); //to hide the keyboard - if any
                                  authController.registerWithEmailAndPassword(context);
                                }
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already a member? "),
                                TextButton(
                                  onPressed: () => Get.toNamed(Routes.WELCOME_SIGN_IN),
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
