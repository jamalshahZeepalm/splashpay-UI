import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/modules/home/views/Statistics%20&%20History/all_list.dart';
import 'package:splashpay/app/modules/home/views/Statistics%20&%20History/request_list.dart';
import 'package:splashpay/app/modules/home/views/Statistics%20&%20History/send_list.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_popmenu.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
            SizedBox(
              width: 20.w,
            ),
            Text(
              'History',
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
                .copyWith(color: CustomColors.kBlack),
            tabs: [
              Tab(text: 'All'),
              Tab(
                text: 'Send',
              ),
              Tab(
                text: 'Request',
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: TabBarView(
                children: [
                  AllListDataScreen(),
                  SendListDataScreen(),
                  RequestListDataScreen()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.h, left: 20.w),
              child: Text(
                'Transactions',
                style: CustomTextStyle.kTextStyle14.copyWith(
                  color: CustomColors.kBlack,
                  fontWeight: FontWeight.w900,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
