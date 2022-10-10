import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/typography.dart';

import 'package:splashpay/app/modules/home/views/Sign%20Up/confirm_password.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  var pinController = TextEditingController();
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
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 121.h, left: 77.w, right: 80.w),
          child: Text(
            'Create password',
            style: CustomTextStyle.kTextStyle24
                .copyWith(color: CustomColors.kBlack, fontSize: 25),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.h, left: 85.w, right: 85.w),
          child: PinCodeTextField(
            hintCharacter: '•',
            hintStyle: CustomTextStyle.kTextStyle24.copyWith(
              color: CustomColors.kLightGeryColor,
              fontSize: 40.sp,
            ),
            textStyle: CustomTextStyle.kTextStyle24
                .copyWith(color: CustomColors.kBlack, fontSize: 17.sp),
            onCompleted: ((value) {
              if (value.length == 6) {
                Get.to(() => ConfirmScreen(
                      pinCode: pinController.text,
                    ));
              }
            }),
            obscureText: true,
            controller: pinController,
            backgroundColor: Colors.transparent,
            pinTheme: PinTheme(
              fieldOuterPadding: EdgeInsets.zero,
              inactiveColor: CustomColors.kWhite,
              fieldHeight: 67.h,
              fieldWidth: 30.w,
              disabledColor: CustomColors.kPinCodeColor,
              errorBorderColor: Colors.white,
              selectedColor: CustomColors.kWhite,
              activeColor: CustomColors.kWhite,
              inactiveFillColor: CustomColors.kPinCodeColor,
              selectedFillColor: CustomColors.kPinCodeColor,
              activeFillColor: CustomColors.kWhite,
            ),
            length: 6,
            onChanged: (String value) {},
            appContext: context,
            animationType: AnimationType.none,
            keyboardType: TextInputType.number,
          ),
        ),
      ]),
    );
  }
}
