import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    jumpToNextPage();
    super.initState();
  }

  jumpToNextPage() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed("/login_screen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/laza.svg',
          height: 36.h,
          width: 59.w,
          color: Color(0xffFEFEFE),
        ),
      ),
    );
  }
}
