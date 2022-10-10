// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/modules/home/views/Card/card_successfully_added.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_elevatedbutton.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_popmenu.dart';

class AddNewCardScreen extends StatelessWidget {
  AddNewCardScreen({super.key});
  TextEditingController accountEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController dateTimeEditingController = TextEditingController();
  TextEditingController pinEditingController = TextEditingController();
  TextEditingController address1EditingController = TextEditingController();
  TextEditingController address2EditingController = TextEditingController();
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
            'Cards',
            style: CustomTextStyle.kTextStyle19,
          ),
          MyPopUpMenu(isEditProfileScreen: false)
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 36.h,
            left: 22.w,
            right: 22.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Card Number',
                style: CustomTextStyle.kTextStyle12.copyWith(
                  fontSize: 12.sp,
                  color: CustomColors.kSamiBlack,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.h),
                child: Container(
                  width: 329.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: CustomColors.kBlack, width: 2)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: accountEditingController,
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      helperStyle: CustomTextStyle.kTextStyle12,
                      hintText: '0101 3920 1001 3304',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Container(
                  width: 331.w,
                  height: 90.h,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expired Date',
                            style: CustomTextStyle.kTextStyle12.copyWith(
                              fontSize: 12.sp,
                              color: CustomColors.kSamiBlack,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18.h),
                            child: Container(
                              width: 156.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      color: CustomColors.kBlack, width: 0.3)),
                              child: TextField(
                                keyboardType: TextInputType.datetime,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                controller: dateTimeEditingController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 10.w),
                                  helperStyle: CustomTextStyle.kTextStyle12,
                                  hintText: '01/05/22',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVC/CVV',
                            style: CustomTextStyle.kTextStyle12.copyWith(
                              fontSize: 12.sp,
                              color: CustomColors.kSamiBlack,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18.h),
                            child: Container(
                              width: 156.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: CustomColors.kBlack, width: 0.3),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                maxLength: 3,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                controller: pinEditingController,
                                decoration: InputDecoration(
                                  counterText: "",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 10.w),
                                  helperStyle: CustomTextStyle.kTextStyle12,
                                  hintText: '* * *',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Container(
                  width: 331.w,
                  height: 84.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cardholder Name',
                        style: CustomTextStyle.kTextStyle12.copyWith(
                          fontSize: 12.sp,
                          color: CustomColors.kSamiBlack,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.h),
                        child: Container(
                          width: 331.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: CustomColors.kBlack, width: 0.3),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            controller: nameEditingController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.w),
                              helperStyle: CustomTextStyle.kTextStyle12,
                              hintText: 'Shane Willam',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Container(
                  width: 331.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Billing Address',
                        style: CustomTextStyle.kTextStyle14.copyWith(
                          fontSize: 16.sp,
                          color: CustomColors.kSamiLightBlack,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 26.h),
                        child: Text(
                          'Address Line 1',
                          style: CustomTextStyle.kTextStyle12.copyWith(
                            fontSize: 12.sp,
                            color: CustomColors.kSamiBlack,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.h),
                        child: Container(
                          width: 331.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: CustomColors.kBlack, width: 0.3),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            controller: address1EditingController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.w),
                              helperStyle: CustomTextStyle.kTextStyle12,
                              hintText: '58200 Freetown Street',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24.h),
                        child: Text(
                          'Address Line 2',
                          style: CustomTextStyle.kTextStyle12.copyWith(
                            fontSize: 12.sp,
                            color: CustomColors.kSamiBlack,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.h),
                        child: Container(
                          width: 331.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: CustomColors.kBlack, width: 0.3),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            controller: address2EditingController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.w),
                              helperStyle: CustomTextStyle.kTextStyle12,
                              hintText: '58234 Town Street',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: CustomElevatedButton(
                            textColor: CustomColors.kWhite,
                            color: CustomColors.kBlack,
                            height: 38,
                            width: 331,
                            title: 'Save card',
                            voidCallback: () {
                              Get.to(() => NewCardSuccessfullyAddedScreen());
                            }),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
