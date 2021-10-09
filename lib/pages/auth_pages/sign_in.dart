import 'package:fitness_app/constant/theme.dart';
import 'package:fitness_app/controllers/auth_controllers.dart';
import 'package:fitness_app/helpers/validator.dart';
import 'package:fitness_app/routes/app_pages.dart';
import 'package:fitness_app/widgets/auth_button.dart';
import 'package:fitness_app/widgets/custom_textfield.dart';
import 'package:fitness_app/widgets/password_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool loading = false;

  // bool hidePassword = true;
  // String email = "";
  // String password = "";
  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // late SharedPreferences sharedPreferences;

  // bool isLoggedIn = false;
  //
  // Future signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     return credential.user?.uid;
  //   } on FirebaseAuthException catch (e) {
  //     switch (e.code) {
  //       case "invalid-email":
  //         showToast("This email doesn't exist.");
  //         break;
  //       case "wrong-password":
  //         showToast("Incorrect password!!");
  //         break;
  //       case "user-not-found":
  //         showToast("No user exist with this email");
  //         break;
  //       case "user-disabled":
  //         showToast("Your account has been disabled");
  //         break;
  //       case "operation-not-allowed":
  //         showToast("Please try again later. Requested several times");
  //         break;
  //       case "operation-not-allowed":
  //         showToast("This operation is not allowed");
  //         break;
  //       case "email-already-in-use":
  //         showToast("This email has already been taken");
  //         break;
  //       default:
  //         showToast("Check your network connection. And try again later");
  //     }
  //     return null;
  //   }
  // }
  //
  // signInWithEmail() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       loading = true;
  //     });
  //     await signInWithEmailAndPassword(email, password).then((id) async {
  //       if (id != null) {
  //         QuerySnapshot snapshot =
  //             await usersReference.where('id', isEqualTo: id).get();
  //         currentUser = UserModel.fromDocument(snapshot.docs[0]);
  //         sharedPreferences = await SharedPreferences.getInstance();
  //         await sharedPreferences.setString('email', email);
  //         await sharedPreferences.setString('password', password);
  //         await sharedPreferences.setBool('loggedIn', true);
  //         Get.toNamed("/getStarted");
  //       }
  //     });
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }
  //
  // void forgotPassword() {
  //   if (email != '' &&
  //       RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //           .hasMatch(email)) {
  //     firebaseAuth.sendPasswordResetEmail(email: email);
  //     showToast("Password reset email sent to $email.");
  //   } else
  //     showToast(
  //         'Please enter your correct email to send password reset email.');
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Freak",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Continue your",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        // color: CustomTheme.skyBlue,
                      ),
                    ),
                    Text(
                      "Freaky Routine",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.skyBlue,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '''We have added new workout routines, diet plans and a lot more new features.''',
                      style: TextStyle(
                        fontSize: 15,
                        color: CustomTheme.black3,
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomTextField(
                      controller: authController.emailController,
                      iconData: Icons.email_outlined,
                      hintText: "Enter your email",
                      onChanged: (val) => null,
                      onSaved: (val) =>
                          authController.emailController.text = val!,
                      validator: Validator().email,
                    ),
                    SizedBox(height: 5),
                    PasswordTextField(
                      controller: authController.passwordController,
                      onChanged: (val) => null,
                      onSaved: (val) =>
                          authController.passwordController.text = val!,
                      validator: Validator().password,
                      obscureText: _isObscure,
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        icon: Icon(!_isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () =>
                            setState(() => _isObscure = !_isObscure),
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      // onTap: () => forgotPassword(),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: CustomTheme.black1,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    AuthButton(
                      text: "Sign In",
                      // onPressed: () => signInWithEmail(),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          authController.signInWithEmailAndPassword(context);
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Not a member? "),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.WELCOME_SIGN_UP),
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
    );
  }
}
