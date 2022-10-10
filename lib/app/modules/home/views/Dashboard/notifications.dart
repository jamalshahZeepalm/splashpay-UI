import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/models/notification.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_notification_card.dart';

import '../Widgets/custom_popmenu.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
            'Notifications',
            style: CustomTextStyle.kTextStyle19,
          ),
          MyPopUpMenu(isEditProfileScreen: false),
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 35.h, left: 22.w, right: 22.w),
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomNotificationCards(
              notification: listOfNotification[index],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20.h,
            );
          },
          itemCount: listOfNotification.length,
        ),
      ),
    );
  }
}
