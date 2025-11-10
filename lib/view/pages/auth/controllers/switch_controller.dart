import 'package:get/get.dart';

class SwitchController extends GetxController {
  bool isRememberMe = false;

  void onRememberMeChanged(bool value) {
    isRememberMe = value;
    update();
  }
}
