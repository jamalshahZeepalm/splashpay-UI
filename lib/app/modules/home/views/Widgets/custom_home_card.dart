import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/models/home_card.dart';

import '../../../../data/images_path.dart';

class CustomHomeCardWidget extends StatelessWidget {
  final HomeCard homeCard;
  const CustomHomeCardWidget({
    Key? key,
    required this.hg,
    required this.wd,
    required this.homeCard,
    required this.index,
  }) : super(key: key);
  final int index;
  final double wd, hg;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hg.h,
      width: wd.w,
      child: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            CustomAssets.kCardPng,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 90.h, left: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                homeCard.accountNumber,
                style: CustomTextStyle.kTextStyle12.copyWith(
                  color: CustomColors.kWhite,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                homeCard.cardType,
                style: CustomTextStyle.kTextStyle12.copyWith(
                  fontSize: 8.sp,
                  color: CustomColors.kWhite,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 165.h, left: 18.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                homeCard.userName,
                style: CustomTextStyle.kTextStyle12.copyWith(
                  color: CustomColors.kWhite,
                  fontSize: 13.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 23.w),
                child: Text(
                  '$index / 25',
                  style: CustomTextStyle.kTextStyle12.copyWith(
                    color: CustomColors.kWhite,
                    fontSize: 10.sp,
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
