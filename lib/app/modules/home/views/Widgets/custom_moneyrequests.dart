import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/conts.dart';
import 'package:splashpay/app/data/typography.dart';

import '../../../../models/money_request.dart';
import 'custom_elevatedbutton.dart';

class CustomMoneyRequest extends StatefulWidget {
  MoneyRequest moneyRequest;
  CustomMoneyRequest(
      {Key? key, required this.moneyRequest, required this.index})
      : super(key: key);
  final int index;

  @override
  State<CustomMoneyRequest> createState() => _CustomMoneyRequestState();
}

class _CustomMoneyRequestState extends State<CustomMoneyRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 114.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: CustomColors.kDarkGeryColor.withOpacity(0.1),
          ),
          color: CustomColors.kFillColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.h, left: 19.w, right: 0.w),
                  child: Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      widget.moneyRequest.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 16.h, bottom: 9.h, right: 127.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.moneyRequest.name,
                        style:
                            CustomTextStyle.kTextStyle19.copyWith(fontSize: 16.sp),
                      ),
                      Text(
                        widget.moneyRequest.date,
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
                    top: 0.h,
                    right: 13.w,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$${widget.moneyRequest.money}',
                            style: CustomTextStyle.kTextStyle12.copyWith(
                              fontSize: 12.sp,
                              color: CustomColors.kBlack,
                              fontWeight: FontWeight.bold,
                            ))
                      ]),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 78.w,
                    right: 27.w,
                    bottom: 14.h,
                  ),
                  child: CustomElevatedButton(
                      textColor: CustomColors.kBlack,
                      color: CustomColors.kWhite,
                      height: 30,
                      width: 86,
                      title: 'Decline',
                      voidCallback: () {
                        listOfMoneyRequest.removeWhere(
                            (element) => element.id == widget.moneyRequest.id);
                        setState(() {});
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 51.w,
                    bottom: 14.h,
                  ),
                  child: CustomElevatedButton(
                      textColor: CustomColors.kWhite,
                      color: CustomColors.kBlack,
                      height: 30,
                      width: 86,
                      title: 'Accepts',
                      voidCallback: () {
                        ConstData.addBalance = widget.moneyRequest.money;
                        listOfMoneyRequest.removeWhere(
                            (element) => element.id == widget.moneyRequest.id);
                        setState(() {});
                      }),
                )
              ],
            )
          ],
        ));
  }
}
