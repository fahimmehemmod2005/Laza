import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/utils/widgets/custom_button.dart';
import 'package:laza/utils/widgets/custom_textformfield.dart';
import 'controllers/switch_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                  SizedBox(height: 45.h),
                  InkWell(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xffF5F6FA),
                      child: SvgPicture.asset('assets/icons/right_arrow.svg'),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Sign Up',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 28.sp,
                            color: const Color(0xff1D1E20),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ---------- Text Fields ----------
                  SizedBox(height: 150.h),

                  // Username Field
                  CustomTextFormField(
                    hintText: 'Esther Howard',
                    label: 'Username',
                    validator:( value) {
                      if (value == null || value.isEmpty) {
                        return "User name is required";
                      }
                      return null;
                    }, // Use correct validator
                    suffixIcon: const Icon(Icons.check, color: Color(0xff34C358)),
                  ),
                  SizedBox(height: 20.h),

                  // Password Field
                  CustomTextFormField(
                    hintText: 'HJ@#9783kja',
                    label: 'Password',
                    obscureText: true,
                    validator: ( value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    suffixIcon: Text(
                      'Strong',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        color: const Color(0xff34C358),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Email Field
                  CustomTextFormField(
                    hintText: 'bill.sanders@example.com',
                    label: 'Email Address',
                    validator: ( value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    suffixIcon: const Icon(Icons.check, color: Color(0xff34C358)),
                  ),
                  SizedBox(height: 20.h),

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
                  SizedBox(height: 150.h),

                  // ---------- Submit Button ----------
                  CustomButton(
                    text: 'Sign up',
                    onpress: () {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar(
                          "Success",
                          "Account created successfully!",
                          colorText: Colors.black,
                          snackPosition: SnackPosition.TOP,
                        );
                        Get.toNamed('/login_screen');
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
