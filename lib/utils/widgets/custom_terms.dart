import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsText extends StatelessWidget {
  const TermsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.inter(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8F959E),
          ),
          children: [
            const TextSpan(text: "Don't have a account"),
            TextSpan(
              text: ' Sign up',
              style: GoogleFonts.inter(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF1D1E20),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.toNamed('/signup_screen'),
            ),
          ],
        ),
      ),
    );
  }
}
