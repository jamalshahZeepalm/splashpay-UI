// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/models/onboard.dart';
import 'package:splashpay/app/modules/home/views/Sign%20Up/signup_screen.dart';

class OnboardingWidget extends StatefulWidget {
  OnBoarding onBoarding;

  OnboardingWidget(
      {Key? key,
      required this.onBoarding,
      required this.controller,
      required this.currentIndex})
      : super(key: key);
  PageController controller;
  int currentIndex;

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: 700.22.h,
          width: 408.5.w,
          child: Image.asset(widget.onBoarding.image),
        ),
        bottomSheet: Container(
          decoration: BoxDecoration(
              color: CustomColors.kBlack,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23.r), topRight: Radius.circular(23.r))),
          width: double.infinity,
          height: 375.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 311.w,
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 55.h,
                    left: 22.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.onBoarding.title,
                        style: CustomTextStyle.kTextStyle24.copyWith(
                          fontSize: 25.sp,
                          color: CustomColors.kWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(widget.onBoarding.subTitle,
                          style: CustomTextStyle.kTextStyle12)
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 22.w),
                    child: AnimatedSmoothIndicator(
                      activeIndex: widget.currentIndex,
                      count: list.length,
                      effect: WormEffect(
                        radius: 10.h,
                        dotWidth: 7.h,
                        dotHeight: 7.h,
                        activeDotColor: CustomColors.kWhite,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, right: 22.w),
                    child: InkWell(
                      onTap: () {
                        if (widget.currentIndex == 2) {
                          Get.offAll(
                            () => const SignUpScreen(),
                          );
                        } else {
                          widget.currentIndex++;
                          widget.controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);

                          setState(() {});
                        }
                      },
                      child: Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: CustomColors.kWhite),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              SvgPicture.asset(CustomAssets.kIconsArrowRight),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
