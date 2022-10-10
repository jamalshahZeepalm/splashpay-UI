import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/data/typography.dart';

import 'package:splashpay/app/models/transaction.dart';

import '../../../../data/colors.dart';

class CustomTransactionCard extends StatelessWidget {
  const CustomTransactionCard({Key? key, required this.transaction})
      : super(key: key);
  final Transaction transaction;
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
                  transaction.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 14.h, left: 3.w, right: 130.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.name,
                    style: CustomTextStyle.kTextStyle19.copyWith(fontSize: 16.sp),
                  ),
                  Text(
                    transaction.date,
                    style: CustomTextStyle.kTextStyle12.copyWith(
                      fontSize: 12.sp,
                      color: CustomColors.kDarkGeryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, right: 10.w),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: CustomColors.kLightGeryColor.withOpacity(0.3)),
                  child: Text(transaction.status,
                      style: CustomTextStyle.kTextStyle12.copyWith(
                        fontSize: 12.sp,
                        color: transaction.transactionType ==
                                    TransactionType.income ||
                                transaction.transactionType ==
                                    TransactionType.onProgress
                            ? CustomColors.kDarkBlue
                            : CustomColors.kSamiOrange,
                      )),
                ),
                Text('\$ ${transaction.money.toString()}',
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
