import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/models/home_center_card.dart';

class CustomHomeCenterCardWidget extends StatelessWidget {
  const CustomHomeCenterCardWidget({
    Key? key,
    required this.index,
    required this.homeCenterCard,
  }) : super(key: key);
  final HomeCenterCard homeCenterCard;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 331.w,
        height: 73.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: CustomColors.kDarkGeryColor.withOpacity(0.1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 9.h, left: 13.w, bottom: 10.h),
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  homeCenterCard.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 14.h, left: 10.w, bottom: 10.h, right: 100.w),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeCenterCard.name,
                      style: CustomTextStyle.kTextStyle19.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      homeCenterCard.date,
                      style: CustomTextStyle.kTextStyle12.copyWith(
                        fontSize: 12.sp,
                        color: CustomColors.kDarkGeryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                right: 13.w,
              ),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: CustomColors.kLightGeryColor.withOpacity(0.3)),
                  child: Text(homeCenterCard.status,
                      style: CustomTextStyle.kTextStyle12.copyWith(
                        fontSize: 13.sp,
                        color: homeCenterCard.money < 20.73
                            ? CustomColors.kDarkBlue
                            : CustomColors.kSamiOrange,
                      )),
                ),
                Text('\$ ${homeCenterCard.money.toString()}',
                    style: CustomTextStyle.kTextStyle12.copyWith(
                      fontSize: 14.sp,
                      color: CustomColors.kBlack,
                      fontWeight: FontWeight.w900,
                    ))
              ]),
            )
          ],
        ));
  }
}
