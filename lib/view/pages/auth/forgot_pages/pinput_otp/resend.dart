import 'package:get/get.dart';
import 'dart:async';

class OTPController extends GetxController {
  var otpTimer = 30.obs;   // Total timer in seconds (initially 30 seconds)
  var isResendAllowed = false.obs;  // To enable or disable Resend OTP button
  late Timer _timer;  // Timer instance

  String get formattedTimer {
    int minutes = otpTimer.value ~/ 60;  // Get minutes
    int seconds = otpTimer.value % 60;  // Get remaining seconds
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void onInit() {
    super.onInit();
    startOtpTimer();
  }

  // Start OTP countdown timer
  void startOtpTimer() {
    otpTimer.value = 30; // Reset timer to 30 seconds
    isResendAllowed.value = false;  // Disable resend initially

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (otpTimer.value > 0) {
        otpTimer.value--;  // Decrease the timer by 1 every second
      } else {
        isResendAllowed.value = true;  // Allow resend after 30 seconds
        _timer.cancel();
      }
    });
  }

  // Resend OTP function (reset the timer)
  void resendOtp() {
    if (isResendAllowed.value) {
      startOtpTimer(); // Restart timer
      // Call your OTP resend API or logic here
      print("Resending OTP...");
    }
  }

  @override
  void onClose() {
    _timer.cancel();  // Don't forget to cancel the timer when the controller is disposed
    super.onClose();
  }
}
