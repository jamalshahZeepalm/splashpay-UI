import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/colors.dart';
import '../../../../data/images_path.dart';
import '../../../../data/typography.dart';
import 'custom_elevatedbutton.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key? key, required this.isLogoutDialog})
      : super(key: key);
  final bool isLogoutDialog;
  @override
  Widget build(BuildContext context) {
    if (isLogoutDialog == true) {
      return AlertDialog(
        elevation: 12,
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero.copyWith(
          bottom: 22.h,
        ),
        backgroundColor: CustomColors.kFillColor,
        content: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 256.w),
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: CustomColors.kWhite),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(CustomAssets.kCloseicon)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 90.w, top: 50.h),
              child: Container(
                width: 102.w,
                height: 102.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: CustomColors.kWhite),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(CustomAssets.kLogOut),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 175.h, left: 60.w),
              child: Text(
                'Want to logout?',
                textAlign: TextAlign.center,
                style: CustomTextStyle.kTextStyle24
                    .copyWith(color: CustomColors.kBlack),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 212.h, left: 60.w),
              child: SizedBox(
                width: 169.w,
                height: 36.h,
                child: Text(
                  'Click on the logout button if you really want to logout?',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.kTextStyle12
                      .copyWith(color: CustomColors.kBlack),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 293.h, left: 50.w),
              child: CustomElevatedButton(
                textColor: CustomColors.kWhite,
                color: CustomColors.kBlack,
                height: 39,
                width: 195,
                title: 'Logout',
                voidCallback: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return AlertDialog(
        elevation: 12,
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero.copyWith(
          bottom: 20.h,
        ),
        backgroundColor: CustomColors.kFillColor,
        content: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 100.w, top: 50.h),
              child: Container(
                width: 102.w,
                height: 102.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: CustomColors.kWhite),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(CustomAssets.kResendCode),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 175.h, left: 90.w),
              child: Text(
                'Resend code',
                style: CustomTextStyle.kTextStyle24
                    .copyWith(color: CustomColors.kBlack),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 212.h, left: 90.w),
              child: SizedBox(
                width: 147.w,
                height: 36.h,
                child: Text(
                  'a new code has been send to your Email.',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.kTextStyle12
                      .copyWith(color: CustomColors.kBlack),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 293.h, left: 60.w),
              child: CustomElevatedButton(
                textColor: CustomColors.kWhite,
                color: CustomColors.kBlack,
                height: 39,
                width: 195,
                title: 'Back',
                voidCallback: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
