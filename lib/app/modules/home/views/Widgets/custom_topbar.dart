import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/images_path.dart';
import '../../../../data/typography.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar(
      {Key? key, required this.title, this.sizefont,required this.leftpadding})
      : super(key: key);
  final String title;
  final double? sizefont;
 final double leftpadding;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 395.w,
        height: 158.h,
        child: Stack(
          children: [
            Positioned.fill(
                child: SvgPicture.asset(
              CustomAssets.kSignUpTopBar,
              fit: BoxFit.cover,
            )),
            Image.asset(CustomAssets.kSpiralpng),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: leftpadding.w, top: 70.h),
                  child: Text(
                    title,
                    style: CustomTextStyle.kTextStyle24
                        .copyWith(fontSize: sizefont == 0 ? 24.sp : sizefont),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
