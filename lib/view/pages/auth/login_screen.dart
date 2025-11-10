import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/utils/widgets/custom_button.dart';
import 'package:laza/utils/widgets/custom_terms.dart';
import 'package:laza/utils/widgets/custom_textformfield.dart';
import 'package:laza/view/pages/auth/controllers/switch_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final switchCtrl = Get.put(SwitchController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GetBuilder<SwitchController>(
          builder: (controller) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.h),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Welcome',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 28.sp,
                            color: const Color(0xff1D1E20),
                          ),
                        ),
                        Text(
                          'Please enter your data to continue',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: const Color(0xff8F959E),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ---------- Text Fields ----------
                  SizedBox(height: 150.h),
                  CustomTextFormField(
                    hintText: 'example@gmail.com',
                    label: 'Username',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email or mobile number is required";
                      }

                      //  Bangladeshi mobile number validation
                      final bangladeshPhoneRegex = RegExp(
                        r'^(?:\+8801|01)[0-9]{9}$',
                      );

                      //  Gmail-only validation
                      final gmailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
                      );

                      if (!bangladeshPhoneRegex.hasMatch(value) &&
                          !gmailRegex.hasMatch(value)) {
                        return "Enter a valid Bangladeshi phone number or Gmail address";
                      }

                      return null;
                    },
                    suffixIcon: const Icon(
                      Icons.check,
                      color: Color(0xff34C358),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  CustomTextFormField(
                    hintText: 'HJ@#9783kja',
                    label: 'Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    suffixIcon: Text(
                      'Strong',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        color: Color(0xff34C358),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  //---------- Forgot Password ----------
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Get.toNamed('/forgot_screen'),
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: const Color(0xffEA4335),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  // ---------- Remember Me + Switch ----------
                  Row(
                    children: [
                      Text(
                        'Remember me',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                      const Spacer(),
                      Switch(
                        value: controller.isRememberMe,
                        onChanged: controller.onRememberMeChanged,
                        activeTrackColor: Colors.green,
                      ),
                    ],
                  ),
                  SizedBox(height: 110.h),

                  TermsText(),

                  SizedBox(height: 30.h),

                  // ---------- Submit Button ----------
                  CustomButton(
                    text: 'Login',
                    onpress: () {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar(
                          "Success",
                          "Login successfully!",
                          colorText: Colors.black,
                          snackPosition: SnackPosition.TOP,
                        );
                        Get.toNamed('/main_screen');
                      } else {
                        Get.snackbar(
                          "Error",
                          "Please correct all fields",
                          colorText: Colors.black,
                          snackPosition: SnackPosition.TOP,
                        );
                      }
                    },
                    height: 50.h,
                    width: 335.w,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
