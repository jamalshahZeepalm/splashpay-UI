import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/models/notification.dart';

import '../../../../data/colors.dart';

class CustomNotificationCards extends StatelessWidget {
  final Notifications notification;
  const CustomNotificationCards({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.h,
        color: CustomColors.kFillColor,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 9.h, left: 13.w, bottom: 10.h),
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.kWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    notification.svgIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7.h, left: 17.w),
              child: SizedBox(
                width: 198.w,
                height: 60.h,
                child: Text.rich(
                  TextSpan(
                    style: CustomTextStyle.kTextStyle12.copyWith(
                        color: CustomColors.kBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp),
                    children: [
                      TextSpan(
                        text: notification.title,
                      ),
                      TextSpan(
                        text: notification.boldText,
                        style: CustomTextStyle.kTextStyle12.copyWith(
                            color: CustomColors.kBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 41.w),
              child: SizedBox(
                height: 60.h,
                child: Text(
                  notification.date,
                  style: CustomTextStyle.kTextStyle12.copyWith(fontSize: 12.sp),
                ),
              ),
            )
          ],
        ));
  }
}
