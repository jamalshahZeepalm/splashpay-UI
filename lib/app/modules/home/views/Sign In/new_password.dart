import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/modules/home/views/Sign%20In/signin.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_elevatedbutton.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_textformfield.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmEditingController = TextEditingController();
  String pass = '';
  bool _obscureText = false;
  bool _obscureText2 = false;
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
                Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: Text('New password',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.kTextStyle24
                          .copyWith(color: CustomColors.kBlack)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.w, right: 21.w, top: 87.h),
                  child: CustomTextFormField(
                    fillcolor: CustomColors.kFillColor,
                    passHintText: 'New password',
                    isTextFieldPass: true,
                    suffixIcon: _obscureText
                        ? CustomAssets.kEyeOff
                        : CustomAssets.kEyeOn,
                    isSuffixIcon: true,
                    isObscure: _obscureText,
                    isNewPassFeild: true,
                    emailEditingController: passwordEditingController,
                    inputType: TextInputType.text,
                    suffixIconOnPressed: () {
                      setState(
                        () {
                          _obscureText = !_obscureText;
                        },
                      );
                    },
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty || value == "") {
                        return "This field can't be empty";
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.w, right: 21.w, top: 44.h),
                  child: CustomTextFormField(
                    fillcolor: CustomColors.kFillColor,
                    passHintText: 'Re-type new password',
                    isTextFieldPass: true,
                    suffixIcon: _obscureText2
                        ? CustomAssets.kEyeOff
                        : CustomAssets.kEyeOn,
                    isObscure: _obscureText2,
                    isSuffixIcon: true,
                    isNewPassFeild: true,
                    emailEditingController: confirmEditingController,
                    inputType: TextInputType.text,
                    suffixIconOnPressed: () {
                      setState(
                        () {
                          _obscureText2 = !_obscureText2;
                        },
                      );
                    },
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty || value == "") {
                        return "This field can't be empty";
                      }
                      if (passwordEditingController.text !=
                          confirmEditingController.text) {
                        return "the password does not match";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 200.h, left: 22.w, right: 22.w),
                  child: CustomElevatedButton(
                    height: 38,
                    width: 331,
                    title: 'Send',
                    color: CustomColors.kBlack,
                    voidCallback: () {
                      if (formKey.currentState!.validate()) {
                        Get.offAll(() => SignInScreen());
                      }
                    },
                    textColor: CustomColors.kWhite,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 29.h, left: 22.w, right: 22.w, bottom: 64.h),
                  child: CustomElevatedButton(
                    height: 38,
                    width: 331,
                    title: 'Cancel',
                    color: CustomColors.kWhite,
                    voidCallback: () {
                      Get.back();
                    },
                    textColor: CustomColors.kBlack,
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
