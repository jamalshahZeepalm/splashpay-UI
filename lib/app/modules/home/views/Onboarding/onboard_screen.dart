import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/conts.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/models/onboard.dart';
import 'package:splashpay/app/modules/home/views/Sign%20Up/signup_screen.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_onboarding.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;
  PageController controller = PageController(initialPage: 0);

  get pageViewList => null;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: ConstData.listOfOnBoardingBackgrounfColor,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            statusBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor: Colors.transparent,
          ),
          title: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Get.offAll(
                  () => SignUpScreen(),
                );
              },
              child: Text(
                'Skip',
                style: CustomTextStyle.kTextStyle12.copyWith(
                  fontSize: 15.sp,
                  color: CustomColors.kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        body: PageView.builder(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return OnboardingWidget(
              onBoarding: list[index],
              controller: controller,
              currentIndex: currentIndex,
            );
          },
        ),
      ),
    );
  }
}
