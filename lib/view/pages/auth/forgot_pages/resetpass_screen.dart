import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/utils/widgets/custom_button.dart';
import 'package:laza/utils/widgets/custom_textformfield.dart';

class ResetpassScreen extends StatefulWidget {
  const ResetpassScreen({super.key});

  @override
  State<ResetpassScreen> createState() => _ResetpassScreenState();
}

class _ResetpassScreenState extends State<ResetpassScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                  child: SvgPicture.asset('assets/icons/right_arrow.svg'),
                ),
              ),
              SizedBox(height: 18.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      'New Password',
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
              SizedBox(height: 180.h),

              // Password Field
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
                    color: const Color(0xff34C358),
                  ),
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
                    color: const Color(0xff34C358),
                  ),
                ),
              ),
              SizedBox(height: 220.h),
              Center(
                child: Text(
                  'Please write your new password.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ),

              // ---------- Submit Button ----------
              SizedBox(height: 20.h),
              CustomButton(
                text: 'Sign up',
                onpress: () {
                  if (_formKey.currentState!.validate()) {
                    Get.snackbar(
                      "Success",
                      "Password forgot successfully!",
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
        ),
      ),
    );
  }
}
