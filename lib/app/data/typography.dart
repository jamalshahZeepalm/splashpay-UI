import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashpay/app/data/colors.dart';

class CustomTextStyle {
  static TextStyle kTextStyle24 = TextStyle(
    fontSize: ScreenUtil().setSp(24),
    fontWeight: FontWeight.w700,
    fontFamily: 'Satoshi',
    color: CustomColors.kWhite,
  );
  static TextStyle kTextStyle12 = TextStyle(
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w400,
    fontFamily: 'Satoshi',
    color: CustomColors.kLightGeryColor,
  );
  static TextStyle kTextStyl12 = GoogleFonts.inter(
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.bold,
  );
  static TextStyle kTextStyle14 = TextStyle(
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.w400,
    fontFamily: 'Satoshi',
    color: CustomColors.kDarkGeryColor,
  );
  static TextStyle kTextStyle19 = TextStyle(
    fontSize: ScreenUtil().setSp(19),
    fontWeight: FontWeight.bold,
    fontFamily: 'Satoshi',
    color: CustomColors.kBlack,
  );
  static TextStyle kTextStyle31 = GoogleFonts.inder(
    fontSize: ScreenUtil().setSp(31),
    fontWeight: FontWeight.w500,
    color: CustomColors.kWhite,
  );
}
