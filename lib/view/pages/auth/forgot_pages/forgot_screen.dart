import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/utils/widgets/custom_button.dart';
import 'package:laza/utils/widgets/custom_textformfield.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
                  child: SvgPicture.asset('assets/icons/right_arrow.svg',height: 166.h,width: 225.w),
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  Center(
                    child: Text(
                      'Forgot Password',
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
              SizedBox(height: 80.h),
              CustomTextFormField(
                hintText: 'bill.sanders@example.com',
                label: 'Email Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email or mobile number is required";
                  }

                  //  Bangladeshi mobile number validation
                  final bangladeshPhoneRegex = RegExp(r'^(?:\+8801|01)[0-9]{9}$');

                  //  Gmail-only validation
                  final gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');

                  if (!bangladeshPhoneRegex.hasMatch(value) && !gmailRegex.hasMatch(value)) {
                    return "Enter a valid Bangladeshi phone number or Gmail address";
                  }

                  return null;
                },
              ),

              SizedBox(height: 170.h),
              Center(
                child: Text(
                  'Please write your email to receive a\nconfirmation code to set a new password.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: 'Confirm Mail',
                onpress: () {
                  if (_formKey.currentState!.validate()) {
                    Get.toNamed('/otp_screen');
                  } else {
                    Get.snackbar(
                      "Error",
                      "Please correct all fields",
                      colorText: Colors.black,
                      snackPosition: SnackPosition.TOP,
                    );
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
