import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/modules/home/views/Account%20Creation/congratulations.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_elevatedbutton.dart';

import '../../../../data/typography.dart';
import '../Widgets/custom_dialog.dart';

class CodeSentScreen extends StatefulWidget {
  const CodeSentScreen({Key? key}) : super(key: key);

  @override
  State<CodeSentScreen> createState() => _CodeSentScreenState();
}

class _CodeSentScreenState extends State<CodeSentScreen> {
  var pinController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    pinController.dispose();
  }

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
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Code sent',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.kTextStyle24
                      .copyWith(color: CustomColors.kBlack)),
              SizedBox(
                height: 22.h,
              ),
              SizedBox(
                width: 215.w,
                height: 47.h,
                child: Text(
                  'We have sent a 6 digits code to your given email.',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.kTextStyle12.copyWith(fontSize: 14.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 22.w,
                  right: 22.w,
                  top: 125.h,
                ),
                child: PinCodeTextField(
                  controller: pinController,
                  backgroundColor: Colors.transparent,
                  pinTheme: PinTheme(
                    inactiveColor: CustomColors.kDarkGeryColor,
                    fieldHeight: 50.h,
                    disabledColor: Colors.white,
                    errorBorderColor: Colors.white,
                    selectedColor: CustomColors.kDarkGeryColor,
                    activeColor: CustomColors.kDarkGeryColor,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: CustomColors.kDarkGeryColor,
                    activeFillColor: CustomColors.kDarkGeryColor,
                  ),
                  length: 6,
                  onChanged: (String value) {},
                  appContext: context,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 64.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 16.w,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Haven’t received the verification code?",
                        style: CustomTextStyle.kTextStyle12.copyWith(
                            color: CustomColors.kDarkGeryColor,
                            fontSize: 14.sp),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 16.w,
                    ),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return CustomAlertDialog(
                              isLogoutDialog: false,
                            );
                          },
                        );
                        setState(() {
                          pinController.clear();
                        });
                      },
                      child: Text(
                        'Resend code',
                        style: CustomTextStyle.kTextStyle12.copyWith(
                          color: CustomColors.kBlack,
                          fontSize: 14.sp,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 211.h),
                child: CustomElevatedButton(
                  height: 38,
                  width: 331,
                  title: 'Verify now',
                  color: CustomColors.kBlack,
                  textColor: CustomColors.kWhite,
                  voidCallback: () {
                    Get.to(
                      () => CongratulationsScreen(),
                    );
                  },
                ),
              )
            ]),
      ),
    );
  }
}
