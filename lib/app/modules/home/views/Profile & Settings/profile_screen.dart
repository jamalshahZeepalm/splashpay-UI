import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/modules/home/views/Profile%20&%20Settings/change_email.dart';
import 'package:splashpay/app/modules/home/views/Profile%20&%20Settings/edit_profile.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_popmenu.dart';

import '../../../../data/images_path.dart';
import '../Widgets/custom_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            SizedBox(
              width: 20.w,
            ),
            Text(
              'Profile',
              style: CustomTextStyle.kTextStyle19,
            ),
            MyPopUpMenu(isEditProfileScreen: false),
          ]),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 22.h, left: 22.w, right: 22.w),
            child: Container(
              width: 350.w,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 90.w, right: 87.w),
                    child: Container(
                      width: 150.w,
                      child: Column(
                        children: [
                          Image.asset(
                            CustomAssets.kSairaKhanum,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text.rich(
                            TextSpan(
                              style: CustomTextStyle.kTextStyle12.copyWith(
                                  color: CustomColors.kBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp),
                              children: [
                                TextSpan(
                                  text: 'Saira Khanum',
                                ),
                                TextSpan(
                                  text: ' | 6292019201',
                                  style: CustomTextStyle.kTextStyle12.copyWith(
                                      color: CustomColors.kDarkGeryColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 9.sp),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 26.h,
                    ),
                    child: Container(
                      width: 350.w,
                      height: 292.h,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account',
                              style: CustomTextStyle.kTextStyle14.copyWith(
                                fontSize: 16.sp,
                                color: CustomColors.kSamiLightBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            customCards(
                                svgIcon: CustomAssets.kPerson,
                                title: 'Change Personal Profile',
                                onTab: () {
                                  Get.to(() => EditProfileScreen());
                                }),
                            SizedBox(
                              height: 16.h,
                            ),
                            customCards(
                                svgIcon: CustomAssets.kEmail,
                                title: 'Change Email Address',
                                onTab: () {
                                  Get.to(() => ChangeEmailScreen());
                                }),
                            SizedBox(
                              height: 16.h,
                            ),
                            customCards(
                                svgIcon: CustomAssets.kLock,
                                title: 'Change Password',
                                onTab: () {})
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 21.h,
                    ),
                    child: Container(
                      width: 350.w,
                      height: 187.h,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More Settings',
                              style: CustomTextStyle.kTextStyle14.copyWith(
                                fontSize: 16.sp,
                                color: CustomColors.kSamiLightBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 21.h,
                              ),
                              child: customCards(
                                  svgIcon: CustomAssets.klockopen,
                                  title: 'Account Security',
                                  onTab: () {}),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 137.w, top: 10.h),
                              child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      barrierColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return CustomAlertDialog(
                                          isLogoutDialog: true,
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Log out',
                                    style:
                                        CustomTextStyle.kTextStyle14.copyWith(
                                      color: CustomColors.kSamiOrange,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  customCards(
      {required String svgIcon,
      required String title,
      required VoidCallback onTab}) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: 350.w,
        height: 72.h,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: CustomColors.kFillColor,
            boxShadow: [
              BoxShadow(
                color: CustomColors.kFillColor,
                offset: const Offset(
                  6.0,
                  6.0,
                ),
                blurRadius: 14.0,
                spreadRadius: 12.0,
              )
            ]),
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
          child: Container(
            width: 331.w,
            height: 40.h,
            child: Row(children: [
              Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.kWhite,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      svgIcon,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 170.w,
                    child: Text(
                      title,
                      style: CustomTextStyle.kTextStyle14.copyWith(
                        color: CustomColors.kSamiDarkgrey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 67.w,
              ),
              SvgPicture.asset(CustomAssets.kForwordArrow)
            ]),
          ),
        ),
      ),
    );
  }
}
