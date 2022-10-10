import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/modules/home/views/Dashboard/done_list.dart';
import 'package:splashpay/app/modules/home/views/Dashboard/onprogress.dart';

import '../Widgets/custom_popmenu.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              'Transactions',
              style: CustomTextStyle.kTextStyle19,
            ),
           MyPopUpMenu(isEditProfileScreen: false),
          ]),
          bottom: TabBar(
            indicatorColor: CustomColors.kBlack,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3.0,
            unselectedLabelColor: CustomColors.kTinyLightGrey,
            labelStyle: CustomTextStyle.kTextStyle14
                .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w900)
                .copyWith(color: CustomColors.kBlack),
            tabs: [
              Tab(text: 'On Progress'),
              Tab(
                text: 'Done',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OnProgressScreen(),
            DoneScreen(),
          ],
        ),
      ),
    );
  }
}
