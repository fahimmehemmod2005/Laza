import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/view/pages/auth/forgot_pages/pinput_otp/resend.dart';
import 'package:pinput/pinput.dart';
import '../../../../../utils/widgets/custom_button.dart';
import 'pinput_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final OTPController _controller = Get.put(OTPController());
  final PinController controller = Get.put(PinController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45.h),
              InkWell(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  backgroundColor: const Color(0xffF5F6FA),
                  child: SvgPicture.asset(
                    'assets/icons/right_arrow.svg',
                    height: 166.h,
                    width: 225.w,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  Center(
                    child: Text(
                      'Verification Code',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 28.sp,
                        color: const Color(0xff1D1E20),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  SvgPicture.asset('assets/icons/cloud.svg'),
                ],
              ),
              SizedBox(height: 60.h),
              Obx(() {
                return Center(
                  child: Pinput(
                    length: 4,
                    onChanged: controller.updatePin,
                    defaultPinTheme: PinTheme(
                      width: 70.h,
                      height: 80.w,
                      textStyle: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                          controller.isPinLengthValid() &&
                              controller.isPinValid()
                              ? Colors.grey
                              : Colors.grey,
                        ),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      textStyle: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      height: 80,
                      width: 70,
                    ),
                    submittedPinTheme: PinTheme(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green),
                      ),
                      height: 80,
                      width: 70,
                    ),
                  ),
                );
              }),
              SizedBox(height: 160.h),
              Center(
                child: Row(
                  children: [
                    Obx(() {
                      return Text(
                        _controller.formattedTimer,
                        style: TextStyle(fontSize: 16),
                      );
                    }),
                    SizedBox(width: 10.w),
                    Text(
                      'resend confirmation code.',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Obx(() {
                      return _controller.isResendAllowed.value
                          ? TextButton(
                        onPressed: _controller.resendOtp,
                        child: Text("Resend OTP"),
                      )
                          : Container();
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: 'Confirm Code',
                onpress: () {
                  if (controller.isPinValid()) {
                    Get.snackbar('Success', 'PIN is correct');
                    Get.toNamed('/resetpass_screen');
                  } else {
                    Get.snackbar('Error', 'Incorrect PIN');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
