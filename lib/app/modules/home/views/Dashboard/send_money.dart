import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/models/send_money.dart';
import 'package:splashpay/app/modules/home/views/Dashboard/successfully_transfered.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_elevatedbutton.dart';

import '../Widgets/custom_popmenu.dart';

class SendMoneyScreen extends StatefulWidget {
  final SendMoney sendMoney;
  const SendMoneyScreen({super.key, required this.sendMoney});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

List<String> listOfButton = [
  '100',
  '500',
  '1000',
  '1500',
  '2000',
  '2500',
  '3000',
  '5000'
];
double textAmount = 125.0;
int selectIndex = 0;

List<bool> listOfOnceCilck = [
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
];

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(CustomAssets.kBackArrowIos)),
          Text(
            'Send money',
            style: CustomTextStyle.kTextStyle19,
          ),
          MyPopUpMenu(isEditProfileScreen: false),
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22.w, top: 15.h, right: 22.w),
          child: Container(
            width: 350.w,
            child: Column(children: [
              Container(
                width: double.infinity.w,
                height: 72.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: CustomColors.kFillColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 16.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Available balance',
                          style: CustomTextStyle.kTextStyle19,
                        ),
                        Text(
                          '\$${widget.sendMoney.balance}',
                          style: CustomTextStyle.kTextStyle19,
                        )
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 41.h,
                ),
                child: Container(
                  width: 348.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: CustomColors.kFillColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            widget.sendMoney.profileImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 16.h, left: 14.w, right: 150.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.sendMoney.userName,
                              style: CustomTextStyle.kTextStyle19
                                  .copyWith(fontSize: 16.sp),
                            ),
                            Text(
                              widget.sendMoney.sendingDate,
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
                          right: 13.w,
                          bottom: 10.h,
                        ),
                        child: SvgPicture.asset(CustomAssets.kEdit),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15.h,
                ),
                child: Container(
                  width: 348.w,
                  height: 64.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Note',
                          style: CustomTextStyle.kTextStyle14.copyWith(
                              color: CustomColors.kBlack, fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          width: 348.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: CustomColors.kFillColor,
                          ),
                          child: TextField(
                            cursorColor: CustomColors.kBlack,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.h),
                child: Text(
                  '\$${textAmount.toString()}',
                  style: CustomTextStyle.kTextStyle24
                      .copyWith(color: CustomColors.kBlack),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.h),
                child: Container(
                  width: 348.w,
                  height: 180.h,
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: listOfButton.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 1.1),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 64.w,
                        height: 32.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: CustomColors.kFillColor),
                            onPressed: () {
                              if (listOfOnceCilck[index] &&
                                  index == 0 &&
                                  widget.sendMoney.balance >= 100) {
                                listOfOnceCilck[index] = false;
                                setState(() {
                                  textAmount = 100;
                                  widget.sendMoney.balance =
                                      widget.sendMoney.balance - textAmount;
                                });
                              } else if (listOfOnceCilck[index] &&
                                  index == 1 &&
                                  widget.sendMoney.balance >= 500) {
                                listOfOnceCilck[index] = false;
                                setState(() {
                                  textAmount = 500;
                                  widget.sendMoney.balance =
                                      widget.sendMoney.balance - textAmount;
                                });
                              } else if (listOfOnceCilck[index] &&
                                  index == 2 &&
                                  widget.sendMoney.balance >= 1000) {
                                listOfOnceCilck[index] = false;
                                setState(() {
                                  textAmount = 1000;
                                  widget.sendMoney.balance =
                                      widget.sendMoney.balance - textAmount;
                                });
                              } else if (listOfOnceCilck[index] &&
                                  index == 3 &&
                                  widget.sendMoney.balance >= 1500) {
                                listOfOnceCilck[index] = false;
                                setState(() {
                                  textAmount = 1500;
                                  widget.sendMoney.balance =
                                      widget.sendMoney.balance - textAmount;
                                });
                              } else if (listOfOnceCilck[index] &&
                                  index == 4 &&
                                  widget.sendMoney.balance >= 2000) {
                                listOfOnceCilck[index] = false;
                                setState(() {
                                  textAmount = 2000;
                                  widget.sendMoney.balance =
                                      widget.sendMoney.balance - textAmount;
                                });
                              } else if (listOfOnceCilck[index] &&
                                  index == 5 &&
                                  widget.sendMoney.balance >= 2500) {
                                listOfOnceCilck[index] = false;
                                setState(() {
                                  textAmount = 2500;
                                  widget.sendMoney.balance =
                                      widget.sendMoney.balance - textAmount;
                                });
                              } else if (listOfOnceCilck[index] &&
                                  index == 6 &&
                                  widget.sendMoney.balance >= 3000) {
                                listOfOnceCilck[index] = false;
                                setState(() {
                                  textAmount = 3000;
                                  widget.sendMoney.balance =
                                      widget.sendMoney.balance - textAmount;
                                });
                              } else if (listOfOnceCilck[index] &&
                                  index == 7 &&
                                  widget.sendMoney.balance >= 5000) {
                                listOfOnceCilck[index] = false;
                                setState(() {
                                  textAmount = 5000;
                                  widget.sendMoney.balance =
                                      widget.sendMoney.balance - textAmount;
                                });
                              }
                            },
                            child: Text(
                              "\$${listOfButton[index]}",
                              style: CustomTextStyle.kTextStyle12.copyWith(
                                color: CustomColors.kBlack,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70.h),
                child: CustomElevatedButton(
                    textColor: CustomColors.kWhite,
                    color: CustomColors.kBlack,
                    height: 38,
                    width: 331,
                    title: 'Send money',
                    voidCallback: () {
                      Get.to(() => SuccessfullyTransferedScreen(
                            sendMoney: widget.sendMoney,
                            textAmount: textAmount,
                          ));
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
