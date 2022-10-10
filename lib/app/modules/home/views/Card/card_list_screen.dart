import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/modules/home/views/Card/add_new_card.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_home_card.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_popmenu.dart';

import '../../../../data/typography.dart';
import '../../../../models/home_card.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
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
            'Cards',
            style: CustomTextStyle.kTextStyle19,
          ),
          MyPopUpMenu(isEditProfileScreen: false),
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 22.w, right: 20.w, top: 46.h),
        child: Container(
          width: 350.w,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 45.h,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => AddNewCardScreen());
                    },
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      child: ClipRRect(
                        child: Container(
                          height: 38.h,
                          width: 348.w,
                          color: CustomColors.kFillColor,
                          child: Center(
                            child: Text(
                              '+ Add new card',
                              style: CustomTextStyle.kTextStyle14.copyWith(
                                  color: CustomColors.kBlack,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomHomeCardWidget(
                        index: index,
                        homeCard: listOfCards[index],
                        hg: 208,
                        wd: 331,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20.h,
                      );
                    },
                    itemCount: listOfCards.length,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
