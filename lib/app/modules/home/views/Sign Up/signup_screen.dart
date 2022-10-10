import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/modules/home/views/Account%20Creation/account_verification.dart';
import 'package:splashpay/app/modules/home/views/Sign%20In/forget_password.dart';
import 'package:splashpay/app/modules/home/views/Sign%20In/signin.dart';
import 'package:splashpay/app/modules/home/views/Sign%20Up/create_password.dart';
import 'package:splashpay/app/modules/home/views/Sign%20Up/terms_and_conditions.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_elevatedbutton.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_textformfield.dart';

import '../../../../data/images_path.dart';
import '../Widgets/custom_topbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  String email = '', pass = '';
  bool checkvalue = false;
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //top bar sheet container
              CustomTopBar(title: 'Welcome to slash', leftpadding: 105),
              SizedBox(
                height: 59.h,
              ),
              Container(
                width: 332.w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 123.w, right: 124.w, bottom: 46.h),
                        child: Text(
                          'Sign up',
                          style: CustomTextStyle.kTextStyle24.copyWith(
                            color: CustomColors.kBlack,
                          ),
                        ),
                      ),
                      Text(
                        'Email',
                        style: CustomTextStyle.kTextStyle12
                            .copyWith(fontSize: 14.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 24.h),
                        child: CustomTextFormField(
                          fillcolor: CustomColors.kFillColor,
                          isTextFieldPass: false,
                          isSuffixIcon: false,
                          isObscure: false,
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
                      Padding(
                        padding: EdgeInsets.only(top: 25.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 18.w,
                              height: 18.h,
                              child: Checkbox(
                                  focusColor: CustomColors.kLightGeryColor,
                                  activeColor: CustomColors.kDarkGeryColor,
                                  value: checkvalue,
                                  checkColor: CustomColors.kLightGeryColor,
                                  onChanged: (value) {
                                    setState(() {
                                      checkvalue = value!;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => TermsAndConditionsScreen());
                              },
                              child: Text.rich(
                                TextSpan(
                                  style: CustomTextStyle.kTextStyle12.copyWith(
                                    color: CustomColors.kBlack,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'I have agree to our ',
                                    ),
                                    TextSpan(
                                      text: 'terms and conditions.',
                                      style:
                                          CustomTextStyle.kTextStyle12.copyWith(
                                        color: CustomColors.kBlack,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w900,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 55.h,
                        ),
                        child: CustomElevatedButton(
                          height: 38,
                          width: 331,
                          title: 'Signup',
                          color: CustomColors.kBlack,
                          voidCallback: () {
                            if (formKey.currentState!.validate()) {
                              Get.to(
                                () => AccountVerificationScreen(),
                              );
                            }
                          },
                          textColor: CustomColors.kWhite,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 19.h,
                        ),
                        child: CustomElevatedButton(
                          height: 38,
                          width: 331,
                          title: 'Sign up with Phone number',
                          color: CustomColors.kWhite,
                          textColor: CustomColors.kBlack,
                          voidCallback: () {
                            Get.off(() => CreatePasswordScreen());
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 61.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => SignInScreen());
                              },
                              child: Text.rich(
                                TextSpan(
                                  style: CustomTextStyle.kTextStyle12.copyWith(
                                      color: CustomColors.kBlack,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp),
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account ?',
                                    ),
                                    TextSpan(
                                      text: ' Sign in',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
