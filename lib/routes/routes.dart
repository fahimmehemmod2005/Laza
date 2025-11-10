import 'package:get/get.dart';
import 'package:laza/view/pages/auth/forgot_screen.dart';
import 'package:laza/view/pages/auth/login_screen.dart';
import 'package:laza/view/pages/auth/signup_screen.dart';
import 'package:laza/view/pages/home/home_screen.dart';
import 'package:laza/view/pages/splash/splash_screen.dart';

class Routes {
  static String splashScreen = "/";
  static String loginScreen = "/login_screen";
  static String homeScreen = "/home_screen";
  static String forgotScreen = "/forgot_screen";
  static String signupScreen = "/signup_screen";
}

List<GetPage> pages = [
  GetPage(name: Routes.splashScreen, page: () => SplashScreen()),

  GetPage(name: Routes.loginScreen, page: () => LoginScreen()),

  GetPage(name: Routes.homeScreen, page: () => HomeScreen()),

  GetPage(name: Routes.forgotScreen, page: () => ForgotScreen()),

  GetPage(name: Routes.signupScreen, page: () => SignupScreen()),
];
