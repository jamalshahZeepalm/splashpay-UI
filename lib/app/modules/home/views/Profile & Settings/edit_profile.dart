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

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController birthdayEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();
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
            'Edit profile',
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
                      'Name',
                      style: CustomTextStyle.kTextStyle12.copyWith(
                          fontSize: 13.sp,
                          color: CustomColors.kBlack.withOpacity(0.4)),
                    ),
                    customTextfield(
                      isSuffixIcon: false,
                      hint: 'Saira khanum',
                      obscure: false,
                      isTextFieldPas: false,
                      controller: nameEditingController,
                      onChanged: (value) {},
                      myValidator: (value) {
                        if (value == "") {
                          return "This field can't be empty";
                        }

                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 24.h,
                      ),
                      child: Text(
                        'Birthday',
                        style: CustomTextStyle.kTextStyle12.copyWith(
                            fontSize: 13.sp,
                            color: CustomColors.kBlack.withOpacity(0.4)),
                      ),
                    ),
                    customTextfield(
                      isSuffixIcon: true,
                      hint: '25 Dec, 2002',
                      obscure: false,
                      isTextFieldPas: false,
                      controller: birthdayEditingController,
                      icon: CustomAssets.kUilCalender,
                      onChanged: (value) {},
                      myValidator: (value) {
                        if (value!.isEmpty || value == "") {
                          return "This field can't be empty";
                        }

                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 24.h,
                      ),
                      child: Text(
                        'Address',
                        style: CustomTextStyle.kTextStyle12.copyWith(
                            fontSize: 13.sp,
                            color: CustomColors.kBlack.withOpacity(0.4)),
                      ),
                    ),
                    customTextfield(
                      isSuffixIcon: true,
                      obscure: false,
                      hint: '245 Garrison Street, Freetown',
                      isTextFieldPas: false,
                      controller: addressEditingController,
                      icon: CustomAssets.kEdits,
                      onChanged: (value) {},
                      myValidator: (value) {
                        if (value!.isEmpty || value == "") {
                          return "This field can't be empty";
                        }

                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 240.h),
                      child: CustomElevatedButton(
                        height: 38,
                        width: 350,
                        title: 'Save',
                        color: CustomColors.kBlack,
                        textColor: CustomColors.kWhite,
                        voidCallback: () {
                          Get.back();
                          Get.snackbar(
                            'Edit Profile',
                            'your Edit Profile successfully save!',
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

  customTextfield({
    String? hint,
    required bool obscure,
    required TextEditingController controller,
    String? passes,
    String? icon,
    required bool isSuffixIcon,
    InputBorder? underline,
    required isTextFieldPas,
    required String? Function(String?)? myValidator,
    required Function(String?) onChanged,
  }) {
    return Container(
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
          validator: myValidator,
          isTextFieldPass: isTextFieldPas,
          isSuffixIcon: isSuffixIcon,
          onChanged: onChanged),
    );
  }
}
