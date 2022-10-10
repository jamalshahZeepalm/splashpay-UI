import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/modules/home/views/Sign%20In/new_password.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_elevatedbutton.dart';

import '../Widgets/custom_textformfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();

  String email = '';
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
      body: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text('Forgot password',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.kTextStyle24
                        .copyWith(color: CustomColors.kBlack)),
                Padding(
                  padding: EdgeInsets.only(top: 48.h),
                  child: SvgPicture.asset(CustomAssets.kQuestionMark),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 23.w, right: 21.w, top: 47.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: CustomTextStyle.kTextStyle12
                            .copyWith(fontSize: 14.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 24.h),
                        child: CustomTextFormField(
                          isTextFieldPass: false,
                          fillcolor: CustomColors.kFillColor,
                          isObscure: false,
                          isSuffixIcon: false,
                          emailEditingController: emailEditingController,
                          inputType: TextInputType.emailAddress,
                          onChanged: (value) {
                            // ye tb use krte jb controller na pass kro
                          },
                          validator: (value) {
                            if (value!.isEmpty || value == "") {
                              return "This field can't be empty";
                            }
                            if (!value.isEmail) {
                              return 'Please enter a correct email';
                            }

                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                SizedBox(
                  width: 300.w,
                  height: 45.h,
                  child: Text(
                    'Enter your registered email addresss to get reset instructions',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.kTextStyle12.copyWith(fontSize: 14.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 137.h, left: 22.w, right: 22.w),
                  child: CustomElevatedButton(
                    height: 38,
                    width: 331,
                    title: 'Send',
                    color: CustomColors.kBlack,
                    voidCallback: () {
                      if (formKey.currentState!.validate()) {
                        Get.to(
                          () => NewPasswordScreen(),
                        );
                      }
                    },
                    textColor: CustomColors.kWhite,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
