import 'package:get/get.dart';
import 'package:laza/view/pages/auth/forgot_pages/forgot_screen.dart';
import 'package:laza/view/pages/auth/forgot_pages/resetpass_screen.dart';
import 'package:laza/view/pages/auth/login_screen.dart';
import 'package:laza/view/pages/auth/forgot_pages/pinput_otp/otp_screen.dart';
import 'package:laza/view/pages/auth/signup_screen.dart';
import 'package:laza/view/pages/home/main_screen.dart';
import 'package:laza/view/pages/splash/splash_screen.dart';

class Routes {
  static String splashScreen = "/";
  static String loginScreen = "/login_screen";
  static String mainScreen = "/main_screen";
  static String forgotScreen = "/forgot_screen";
  static String signupScreen = "/signup_screen";
  static String otpScreen = "/otp_screen";
  static String resetpassScreen = "/resetpass_screen";

}

List<GetPage> pages = [
  GetPage(name: Routes.splashScreen, page: () => SplashScreen()),

  GetPage(name: Routes.loginScreen, page: () => LoginScreen()),

  GetPage(name: Routes.mainScreen, page: () => MainScreen()),

  GetPage(name: Routes.forgotScreen, page: () => ForgotScreen()),

  GetPage(name: Routes.signupScreen, page: () => SignupScreen()),

  GetPage(name: Routes.otpScreen, page: () => OtpScreen()),

  GetPage(name: Routes.resetpassScreen, page: () => ResetpassScreen()),
];
