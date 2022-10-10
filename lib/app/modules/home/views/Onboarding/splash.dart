import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/conts.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/modules/home/views/Onboarding/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kLightBlack,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: ConstData.listOfColor,
          ),
        ),
        child: AnimatedSplashScreen(
          animationDuration: Duration(seconds: 1),
          splashIconSize: 700.sp,
          duration: 3000,
          backgroundColor: Colors.transparent,
          splash: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: CircularProgressIndicator(
                    backgroundColor: CustomColors.kLightPurple,
                    valueColor: AlwaysStoppedAnimation(
                      CustomColors.kLightSkyBlue,
                    ),
                    strokeWidth: 4.3.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 17.6.h),
                child: Text(
                  'Slashpay',
                  style: CustomTextStyle.kTextStyle31,
                ),
              )
            ],
          ),
          nextScreen: OnBoardScreen(),
        ),
      ),
    );
  }
}
