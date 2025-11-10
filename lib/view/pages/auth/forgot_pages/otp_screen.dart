import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
              CustomButton(
                text: 'Confirm Code',
                onpress: () =>
                  Get.toNamed('/resetpass_screen')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
