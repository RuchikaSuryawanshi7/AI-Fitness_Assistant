import 'package:fitness_app/pages/auth_pages/sign_in.dart';
import 'package:fitness_app/pages/auth_pages/sign_up.dart';
import 'package:fitness_app/pages/auth_pages/welcome_sign_in.dart';
import 'package:fitness_app/pages/auth_pages/welcome_sign_up.dart';
import 'package:fitness_app/pages/facts_screen.dart';
import 'package:fitness_app/pages/get_started.dart';
import 'package:fitness_app/pages/home_pages/BMI/bmi_page.dart';
import 'package:fitness_app/pages/home_pages/BMI/bmi_result.dart';
import 'package:fitness_app/pages/home_pages/Readings/freakyTips.dart';
import 'package:fitness_app/pages/home_pages/WeightGainDiets/Breakfast.dart';
import 'package:fitness_app/pages/home_pages/chatbot/chatbot.dart';
import 'package:fitness_app/pages/home_pages/diet/Weight_Gain_Diet.dart';
import 'package:fitness_app/pages/home_pages/exercise/ExerciseInfo.dart';
import 'package:fitness_app/pages/home_pages/exercise/WeightLoss/WeightLossExercise.dart';
import 'package:fitness_app/pages/home_pages/exercise/freakyPlans.dart';
import 'package:fitness_app/pages/home_pages/home/home_page.dart';
import 'package:fitness_app/pages/home_pages/immunity/immunity_checkup.dart';
import 'package:fitness_app/pages/home_pages/immunity/immunity_checkup_review.dart';
import 'package:fitness_app/pages/home_pages/immunity/immunity_report.dart';
import 'package:fitness_app/pages/home_pages/profile/edit_profile.dart';
import 'package:fitness_app/pages/home_pages/profile/profile.dart';
import 'package:fitness_app/pages/workout_complete.dart';
import 'package:fitness_app/widgets/splash.dart';
import 'package:fitness_app/widgets/unknown_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static var unknownPage = GetPage(name: "unknown", page: () => UnknownPage());

  static final routes = [
    GetPage(name: Routes.WELCOME_SIGN_IN, page: () => WelcomeSignIn()),
    GetPage(name: Routes.WELCOME_SIGN_UP, page: () => WelcomeSignUp()),
    GetPage(name: Routes.SIGN_IN, page: () => SignInPage()),
    GetPage(name: Routes.SIGN_UP, page: () => SignUpPage()),
    GetPage(name: Routes.GET_STARTED, page: () => GetStarted()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.SPLASH, page: () => Splash()),
    GetPage(name: Routes.IMMUNITY_CHECKUP, page: () => ImmunityCheckupPage()),
    GetPage(name: Routes.FREAKY_TIPS, page: () => FreakyTips()),
    GetPage(name: Routes.FACTS, page: () => FactsScreen()),
    GetPage(name: Routes.WORKOUT_COMPLETE, page: () => WorkoutComplete()),
    GetPage(name: Routes.BMI, page: () => BMIPage()),
    GetPage(name: Routes.BMI_RESULT, page: () => BMIResult()),
    GetPage(name: Routes.BREAKFAST, page: () => Breakfast()),
    GetPage(name: Routes.PROFILE, page: () => ProfilePage()),
    GetPage(name: Routes.EDIT_PROFILE, page: () => EditProfile()),
    GetPage(name: Routes.WEIGHT_GAIN_DIET, page: () => WeightGain()),
    GetPage(name: Routes.CHAT_BOT, page: () => ChatBot()),
    GetPage(name: Routes.IMMUNITY_REPORT, page: () => ImmunityReport()),
    GetPage(name: Routes.FREAKY_PLANS, page: () => FreakyPlans()),
    GetPage(
      name: Routes.IMMUNITY_CHECKUP_REVIEW,
      page: () => ImmunityCheckupReviewPage(),
    ),
    GetPage(
      name: Routes.WEIGHT_LOSS_EXERCISES,
      page: () => WeightLossExercises(),
    ),
    GetPage(
      name: Routes.WEIGHT_LOSS_EXERCISES_Tutorial,
      page: () => ExerciseTutorialPage(),
    ),
  ];
}
