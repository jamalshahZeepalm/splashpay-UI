import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_popmenu.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_textformfield.dart';

import '../../../../data/typography.dart';
import '../Widgets/custom_elevatedbutton.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController newEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  String email = '', pass = '';
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
            'Change email',
            style: CustomTextStyle.kTextStyle19,
          ),
          MyPopUpMenu(isEditProfileScreen: true),
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 24.h,
            left: 22.w,
            right: 22.w,
          ),
          child: Container(
            width: 350.w,
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current email',
                      style: CustomTextStyle.kTextStyle12.copyWith(
                          fontSize: 13.sp,
                          color: CustomColors.kBlack.withOpacity(0.4)),
                    ),
                    customTextfield(
                        isSuffixIcon: false,
                        hint: 'sairakhanum@gmail.com',
                        obscure: false,
                        isTextFieldPas: false,
                        controller: emailEditingController),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 24.h,
                      ),
                      child: Text(
                        'New email',
                        style: CustomTextStyle.kTextStyle12.copyWith(
                            fontSize: 13.sp,
                            color: CustomColors.kBlack.withOpacity(0.4)),
                      ),
                    ),
                    customTextfield(
                      isSuffixIcon: false,
                      hint: 'alexander23@gmail.com',
                      obscure: false,
                      isTextFieldPas: false,
                      controller: newEditingController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 24.h,
                      ),
                      child: Text(
                        'Enter your email password',
                        style: CustomTextStyle.kTextStyle12.copyWith(
                            fontSize: 13.sp,
                            color: CustomColors.kBlack.withOpacity(0.4)),
                      ),
                    ),
                    customTextfield(
                        isSuffixIcon: true,
                        obscure: true,
                        passes: '• • • • • •',
                        isTextFieldPas: true,
                        isNewPassFeild: false,
                        underline:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        controller: passwordEditingController,
                        icon: CustomAssets.kEyeOff),
                    Padding(
                      padding: EdgeInsets.only(top: 211.h),
                      child: CustomElevatedButton(
                        height: 38,
                        width: 350,
                        title: 'Save',
                        color: CustomColors.kBlack,
                        textColor: CustomColors.kWhite,
                        voidCallback: () {
                          Get.back();
                          Get.snackbar(
                            'Email Change',
                            'your Email Change successfully',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  customTextfield(
      {String? hint,
      required bool obscure,
      required TextEditingController controller,
      String? passes,
      String? icon,
      bool? isNewPassFeild,
      required bool isSuffixIcon,
      InputBorder? underline,
      required isTextFieldPas}) {
    return Padding(
      padding: EdgeInsets.only(
        top: 18.h,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: CustomColors.kSamiBlack.withOpacity(0.3),
          ),
        ),
        child: CustomTextFormField(
            passHintText: passes,
            hint: hint,
            underline: underline,
            fillcolor: CustomColors.kWhite,
            emailEditingController: controller,
            inputType: TextInputType.emailAddress,
            isObscure: obscure,
            suffixIcon: icon,
            validator: (val) {
              return null;
            },
            isTextFieldPass: isTextFieldPas,
            isSuffixIcon: isSuffixIcon,
            isNewPassFeild: isNewPassFeild,
            onChanged: (v) {}),
      ),
    );
  }
}
