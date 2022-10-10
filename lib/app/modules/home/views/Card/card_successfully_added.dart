import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';

class NewCardSuccessfullyAddedScreen extends StatelessWidget {
  const NewCardSuccessfullyAddedScreen({Key? key}) : super(key: key);

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
      ),
      body: Center(
        child: Container(
          height: 224.h,
          child: Column(children: [
            SvgPicture.asset(CustomAssets.kTaskDone),
            SizedBox(
              height: 27.h,
            ),
            Text(
              'New card successfully added',
              style: CustomTextStyle.kTextStyle19,
            )
          ]),
        ),
      ),
    );
  }
}
