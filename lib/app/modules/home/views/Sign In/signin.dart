import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/modules/home/views/Nav%20Bar/navbar.dart';
import 'package:splashpay/app/modules/home/views/Sign%20In/forget_password.dart';
import 'package:splashpay/app/modules/home/views/Sign%20Up/signup_screen.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_textformfield.dart';

import '../../../../data/colors.dart';
import '../../../../data/typography.dart';
import '../Widgets/custom_elevatedbutton.dart';
import '../Widgets/custom_topbar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  String email = '', pass = '';
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //top bar sheet container
              CustomTopBar(title: 'Slashpay', sizefont: 31.sp, leftpadding: 120),

              Padding(
                padding: EdgeInsets.only(top: 91.h, left: 22.w, right: 22.w),
                child: Container(
                  width: 332.w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 123.w,
                            right: 124.w,
                          ),
                          child: Text(
                            'Sign in',
                            style: CustomTextStyle.kTextStyle24.copyWith(
                              color: CustomColors.kBlack,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 33.h),
                          child: Text(
                            'Email',
                            style: CustomTextStyle.kTextStyle12
                                .copyWith(fontSize: 14.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 24.h),
                          child: CustomTextFormField(
                            fillcolor: CustomColors.kFillColor,
                            isObscure: false,
                            isSuffixIcon: false,
                            isTextFieldPass: false,
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
                                return 'Please enter  a correct email';
                              }

                              return null;
                            },
                          ),
                        ),
                        Text(
                          'Password',
                          style: CustomTextStyle.kTextStyle12
                              .copyWith(fontSize: 14.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
                          ),
                          child: CustomTextFormField(
                            suffixIconOnPressed: () {
                              setState(
                                () {
                                  _obscureText = !_obscureText;
                                },
                              );
                            },
                            fillcolor: CustomColors.kFillColor,
                            isTextFieldPass: false,
                            isSuffixIcon: true,
                            emailEditingController: passwordEditingController,
                            suffixIcon: _obscureText
                                ? CustomAssets.kEyeOff
                                : CustomAssets.kEyeOn,
                            inputType: TextInputType.text,
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isEmpty || value == "") {
                                return "This field can't be empty";
                              }

                              return null;
                            },
                            isObscure: _obscureText,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => ForgotPasswordScreen());
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: CustomTextStyle.kTextStyle12
                                      .copyWith(color: CustomColors.kBlack),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 55.h,
                        ),
                        CustomElevatedButton(
                          height: 38,
                          width: 331,
                          title: 'Sign in',
                          color: CustomColors.kBlack,
                          voidCallback: () {
                            if (formKey.currentState!.validate()) {
                              Get.offAll(
                                () => NavigationBarScreen(),
                              );
                            }
                          },
                          textColor: CustomColors.kWhite,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 61.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => SignUpScreen());
                                },
                                child: Text.rich(
                                  TextSpan(
                                    style: CustomTextStyle.kTextStyle12
                                        .copyWith(
                                            color: CustomColors.kBlack,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp),
                                    children: [
                                      TextSpan(
                                        text: 'Already have an account? ',
                                      ),
                                      TextSpan(
                                        text: 'Sign up',
                                        style: CustomTextStyle.kTextStyle12
                                            .copyWith(
                                                color: CustomColors.kBlack,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15.sp),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
