import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/modules/home/views/Sign%20In/signin.dart';
import 'package:splashpay/app/modules/home/views/Sign%20Up/terms_and_conditions.dart';

import '../Widgets/custom_elevatedbutton.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Congratulations!',
                textAlign: TextAlign.center,
                style: CustomTextStyle.kTextStyle24
                    .copyWith(color: CustomColors.kBlack)),
            SizedBox(
              height: 22.h,
            ),
            SizedBox(
              width: 560.w,
              height: 30.h,
              child: Text(
                "You have successfully created your account.",
                textAlign: TextAlign.center,
                style: CustomTextStyle.kTextStyle12.copyWith(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 59.h,
            ),
            SvgPicture.asset(CustomAssets.kTaskDone),
            SizedBox(
              height: 59.h,
            ),
            SizedBox(
              width: 231.w,
              height: 44.h,
              child: InkWell(
                onTap: () {
                  Get.to(() => TermsAndConditionsScreen());
                },
                child: Text.rich(
                  TextSpan(
                    style: CustomTextStyle.kTextStyle12.copyWith(
                        color: CustomColors.kBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                    children: [
                      TextSpan(
                        text: 'By clicking continue, you agree to our ',
                      ),
                      TextSpan(
                        text: ' Terms and Conditions',
                        style: CustomTextStyle.kTextStyle12.copyWith(
                            color: CustomColors.kBlack,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            fontSize: 15.sp),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 128.h),
              child: CustomElevatedButton(
                height: 38,
                width: 331,
                title: 'Continue',
                color: CustomColors.kBlack,
                textColor: CustomColors.kWhite,
                voidCallback: () {
                  Get.to(
                    () => SignInScreen(),
                  );
                },
              ),
            )
          ]),
    );
  }
}
