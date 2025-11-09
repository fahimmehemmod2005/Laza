import 'package:get/get.dart';
import 'package:laza/view/pages/auth/login_screen.dart';
import '../view/pages/splash/splash_screen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.splashScreen;

  static final routes = [

    GetPage(
      name: _Paths.splashScreen,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: _Paths.loginScreen,
      page: () => LoginScreen(),
    ),

  ];
}