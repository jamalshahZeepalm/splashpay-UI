import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/conts.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/models/send_money.dart';
import 'package:splashpay/app/modules/home/views/Dashboard/send_money.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_elevatedbutton.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_popmenu.dart';

class ScanCodeScreen extends StatefulWidget {
  ScanCodeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanCodeScreen> createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {
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
            'Quick pay',
            style: CustomTextStyle.kTextStyle19,
          ),
         MyPopUpMenu(isEditProfileScreen: false),
        ]),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 147.h),
              child: Container(
                  width: 240.w,
                  height: 240.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: CustomColors.kBlack,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(CustomAssets.kBarCode),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.h),
              child: Text('Paying to Ahmer \$125',
                  style: CustomTextStyle.kTextStyle19),
            ),
            Padding(
              padding: EdgeInsets.only(top: 208.h),
              child: CustomElevatedButton(
                  textColor: CustomColors.kWhite,
                  color: CustomColors.kBlack,
                  height: 38,
                  width: 331,
                  title: 'Pay now',
                  voidCallback: () {
                    SendMoney sendMoney = SendMoney(
                        profileImage: CustomAssets.kAhmer,
                        userName: 'Ahmer',
                        balance: 345.0+ConstData.addBalance,
                        sendingDate: '25 June, 2022');
                    Get.to(() => SendMoneyScreen(
                          sendMoney: sendMoney,
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
