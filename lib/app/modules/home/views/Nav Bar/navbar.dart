import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/pages.dart';
import 'package:splashpay/app/data/typography.dart';

import '../../../../data/images_path.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  static int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        width: 375.w,
        height: 72.h,
        color: CustomColors.kWhite,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          customBottomNavBar(
            index: 0,
            image: CustomAssets.kLightHomeSvg,
            title: 'Home',
            image2: CustomAssets.kDarkHomeSvg,
            voidCallback: () {
              setState(
                () {
                  selectedIndex = 0;
                },
              );
            },
          ),
          customBottomNavBar(
            index: 1,
            image: CustomAssets.kLightHistorySvg,
            title: 'History',
            image2: CustomAssets.kDarkHistorySvg,
            voidCallback: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
          customBottomNavBar(
            index: 2,
            image: CustomAssets.kLightStaticsvg,
            title: 'Statistic',
            image2: CustomAssets.kDarkStaticsvg,
            voidCallback: () {
              setState(() {
                selectedIndex = 2;
              });
            },
          ),
          customBottomNavBar(
            index: 3,
            image: CustomAssets.kLightPersonsvg,
            title: 'Profile',
            image2: CustomAssets.kDarkPersonsvg,
            voidCallback: () {
              setState(() {
                selectedIndex = 3;
              });
            },
          ),
        ]),
      ),
    );
  }

  Widget customBottomNavBar(
      {required String title,
      required String image,
      required String image2,
      required int index,
      required VoidCallback voidCallback}) {
    return Padding(
      padding: EdgeInsets.only(left: 32.w, right: 31.w, top: 13.h),
      child: Column(
        children: [
          GestureDetector(
              onTap: voidCallback,
              child: selectedIndex == index
                  ? SvgPicture.asset(image2)
                  : SvgPicture.asset(image)),
          Padding(
            padding: EdgeInsets.only(
              top: 3.5.h,
            ),
            child: Text(
              title,
              style: selectedIndex == index
                  ? CustomTextStyle.kTextStyle12.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.kBlack,
                    )
                  : CustomTextStyle.kTextStyle12.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
