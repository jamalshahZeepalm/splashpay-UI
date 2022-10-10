import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/conts.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/models/home_card.dart';
import 'package:splashpay/app/models/home_center_card.dart';
import 'package:splashpay/app/models/send_money.dart';
import 'package:splashpay/app/modules/home/views/Card/card_list_screen.dart';

import 'package:splashpay/app/modules/home/views/Dashboard/moneyrequests_screen.dart';
import 'package:splashpay/app/modules/home/views/Dashboard/notifications.dart';
import 'package:splashpay/app/modules/home/views/Dashboard/quickpay.dart';
import 'package:splashpay/app/modules/home/views/Dashboard/report_screen.dart';
import 'package:splashpay/app/modules/home/views/Dashboard/send_money.dart';
import 'package:splashpay/app/modules/home/views/Dashboard/transactions.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_home_card.dart';

import '../Widgets/custom_home_center_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity.w,
              height: 220.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      CustomAssets.kHomeTopBar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h, left: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome back',
                                style: CustomTextStyle.kTextStyle14
                                    .copyWith(fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shane William',
                                    style:
                                        CustomTextStyle.kTextStyle14.copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.kWhite,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => NotificationsScreen());
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 9.h),
                                      child: SvgPicture.asset(
                                          CustomAssets.kNotificationSvg),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 126.h, left: 22.w, right: 22.w),
                    child: Container(
                      width: 350.w,
                      height: 70.h,
                      color: CustomColors.kFillColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 19.h, vertical: 11.h),
                        child: Container(
                          width: 293.w,
                          height: 47.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                topBarContainer(
                                  onTab: () {
                                    Get.to(() => MoneyRequestsScreen());
                                  },
                                  svgIcon: CustomAssets.kDownwalletIcon,
                                ),
                                topBarContainer(
                                  onTab: () {
                                    SendMoney sendMoney = SendMoney(
                                        profileImage: CustomAssets.kFatima,
                                        balance: 345.0 + ConstData.addBalance,
                                        userName: 'Fatima',
                                        sendingDate: '25 June, 2022');
                                    Get.to(() => SendMoneyScreen(
                                          sendMoney: sendMoney,
                                        ));
                                  },
                                  svgIcon: CustomAssets.kUpwalletIcon,
                                ),
                                topBarContainer(
                                  onTab: () {
                                    Get.to(() => ReportScreen());
                                  },
                                  svgIcon: CustomAssets.kReportIcon,
                                ),
                                topBarContainer(
                                  onTab: () {
                                    Get.to(() => QuickpayScreen());
                                  },
                                  svgIcon: CustomAssets.kCamera,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 18.h,
                left: 22.w,
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => CardListScreen());
                },
                child: Container(
                  height: 250.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            'Your cards',
                            style: CustomTextStyle.kTextStyle19.copyWith(
                                fontSize: 22.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 195.w,
                        ),
                        Text(
                          'View all',
                          style: CustomTextStyle.kTextStyle12.copyWith(
                              color: CustomColors.kBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ]),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        height: 200.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomHomeCardWidget(
                              index: index,
                              homeCard: listOfCards[index],
                              hg: 200,
                              wd: 331,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 15.w,
                            );
                          },
                          itemCount: listOfCards.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 22.w, right: 22.w),
              child: Container(
                width: 331.w,
                height: 263.h,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => TransactionsScreen());
                        },
                        child: Text(
                          'Recent Transactions',
                          style: CustomTextStyle.kTextStyle19.copyWith(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomHomeCenterCardWidget(
                              homeCenterCard: listOfCenterCard[index],
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 15.h,
                            );
                          },
                          itemCount: listOfCenterCard.length,
                        ),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topBarContainer(
      {required String svgIcon, required VoidCallback onTab}) {
    return Container(
      width: 47.w,
      height: 47.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: CustomColors.kWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: onTab,
          child: SvgPicture.asset(svgIcon),
        ),
      ),
    );
  }
}
