// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/models/money_request.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_moneyrequests.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_popmenu.dart';


class MoneyRequestsScreen extends StatefulWidget {
  const MoneyRequestsScreen({super.key});

  @override
  State<MoneyRequestsScreen> createState() => _MoneyRequestsScreenState();
}

class _MoneyRequestsScreenState extends State<MoneyRequestsScreen> {
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
            'Money requests',
            style: CustomTextStyle.kTextStyle19,
          ),
          MyPopUpMenu(isEditProfileScreen: false),
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 32.h),
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CustomMoneyRequest(
              moneyRequest: listOfMoneyRequest[index],
              index: index,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 32.h,
            );
          },
          itemCount: listOfMoneyRequest.length,
        ),
      ),
    );
  }
}
