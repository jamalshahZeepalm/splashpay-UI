import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/typography.dart';

import 'package:splashpay/app/modules/home/views/Widgets/custom_textformfield.dart';

import '../Widgets/custom_elevatedbutton.dart';
import 'code_sent.dart';

class AccountVerificationScreen extends StatefulWidget {
  const AccountVerificationScreen({Key? key}) : super(key: key);

  @override
  State<AccountVerificationScreen> createState() =>
      _AccountVerificationScreenState();
}

class _AccountVerificationScreenState extends State<AccountVerificationScreen> {
  TextEditingController emailEditingController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String email = '';
  bool validate = false;

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
              Text('Account Verification',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.kTextStyle24
                      .copyWith(color: CustomColors.kBlack)),
              SizedBox(
                height: 22.h,
              ),
              SizedBox(
                width: 215.w,
                height: 38.h,
                child: Text(
                  'we will send a code to the email in order to verify your account',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.kTextStyle12.copyWith(fontSize: 14.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 38.h),
                child: Form(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: CustomTextStyle.kTextStyle12
                              .copyWith(fontSize: 14.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
                          ),
                          child: CustomTextFormField(
                            fillcolor: CustomColors.kFillColor,
                            isTextFieldPass: false, isSuffixIcon: false,
                            isObscure: false,

                            emailEditingController: emailEditingController,
                            inputType: TextInputType.emailAddress,
                            onChanged: (value) {
                              setState(() {
                                if (formKey.currentState!.validate()) {
                                  validate = true;
                                } else {
                                  validate = false;
                                }
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty || value == "") {
                                return 'this value cant be empty';
                              }
                              if (!value.isEmail) {
                                return 'Please enter  a correct email';
                              }
                              return null;
                            }, //
                          ),
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 405.h),
                child: CustomElevatedButton(
                  height: 38,
                  width: 331,
                  title: 'Send code',
                  color: validate ? CustomColors.kBlack : CustomColors.kWhite,
                  textColor:
                      validate ? CustomColors.kWhite : CustomColors.kBlack,
                  voidCallback: validate
                      ? () {
                          if (formKey.currentState!.validate()) {
                            Get.to(
                              () => CodeSentScreen(),
                            );
                          }
                        }
                      : null,
                ),
              )
            ]),
      ),
    );
  }
}
