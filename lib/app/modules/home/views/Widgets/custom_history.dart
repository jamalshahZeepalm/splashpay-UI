// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/typography.dart';

import '../../../../models/history.dart';

class CustomHistoryList extends StatelessWidget {
  History history;
  CustomHistoryList({Key? key, required this.history, required this.isAllList})
      : super(key: key);
  final bool isAllList;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 331.w,
        height: 70.h,
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
                  history.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 10.h, right: 134.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history.name,
                    style:
                        CustomTextStyle.kTextStyle19.copyWith(fontSize: 16.sp),
                  ),
                  Text(
                    history.date,
                    style: CustomTextStyle.kTextStyle12.copyWith(
                      fontSize: 12.sp,
                      color: CustomColors.kDarkGeryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
              ),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                isAllList == true
                    ? Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color:
                                CustomColors.kLightGeryColor.withOpacity(0.3)),
                        child: Text(history.status,
                            style: CustomTextStyle.kTextStyle12.copyWith(
                              fontSize: 12.sp,
                              color: history.status == 'Income'
                                  ? CustomColors.kDarkBlue
                                  : CustomColors.kSamiOrange,
                            )),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color:
                                CustomColors.kLightGeryColor.withOpacity(0.3)),
                        child: Text(history.status,
                            style: CustomTextStyle.kTextStyle12.copyWith(
                              fontSize: 12.sp,
                              color: history.historyType == HistoryType.send
                                  ? CustomColors.kDarkBlue
                                  : CustomColors.kSamiOrange,
                            )),
                      ),
                Text('\$${history.money.toString()}',
                    style: CustomTextStyle.kTextStyle12.copyWith(
                      fontSize: 12.sp,
                      color: CustomColors.kBlack,
                      fontWeight: FontWeight.bold,
                    ))
              ]),
            )
          ],
        ));
  }
}
