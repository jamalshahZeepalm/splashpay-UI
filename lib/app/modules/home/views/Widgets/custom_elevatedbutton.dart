import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/typography.dart';

class CustomElevatedButton extends StatelessWidget {
  final int width, height;
  final VoidCallback? voidCallback;
  final String title;
  final Color color;
  final Color textColor;
  const CustomElevatedButton(
      {Key? key,
      required this.textColor,
      required this.color,
      required this.height,
      required this.width,
      required this.title,
      required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: CustomColors.kBlack),
            shape: BoxShape.rectangle,
            color: color),
        width: width.w,
        height: height.h,
        child: Center(
          child: Text(
            title,
            style: CustomTextStyle.kTextStyle12.copyWith(
                fontSize: 14.sp, fontWeight: FontWeight.w700, color: textColor),
          ),
        ),
      ),
    );
  }
}
