// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/typography.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController emailEditingController;
  final TextInputType inputType;

  final String? Function(String?)? validator;
  final void Function(String?) onChanged;
  final String? suffixIcon;
  final bool isObscure, isTextFieldPass, isSuffixIcon;
  final String? passHintText;
  final Color fillcolor;
  final String? hint;
  final InputBorder? underline;
  final bool? isNewPassFeild;

  final VoidCallback? suffixIconOnPressed;
  CustomTextFormField(
      {Key? key,
      this.suffixIconOnPressed,
      this.isNewPassFeild,
      required this.emailEditingController,
      required this.inputType,
      this.suffixIcon,
      required this.isObscure,
      required this.validator,
      this.passHintText,
      required this.isTextFieldPass,
      required this.isSuffixIcon,
      required this.fillcolor,
      this.hint,
      this.underline,
      required this.onChanged})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    if (widget.isTextFieldPass == false) {
      return TextFormField(
        obscureText: widget.isObscure,
        keyboardType: widget.inputType,
        controller: widget.emailEditingController,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: CustomTextStyle.kTextStyle14.copyWith(
            color: CustomColors.kSamiBlack,
          ),
          contentPadding: EdgeInsets.zero.copyWith(left: 16.w),
          fillColor: widget.fillcolor,
          filled: true,
          suffixIcon: widget.isSuffixIcon == true
              ? IconButton(
                  onPressed: widget.suffixIconOnPressed,
                  icon: SvgPicture.asset(
                    widget.suffixIcon!,
                  ))
              : SizedBox(),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
      );
    } else {
      return TextFormField(
        obscureText: widget.isObscure,
        keyboardType: widget.inputType,
        controller: widget.emailEditingController,
        decoration: InputDecoration(
          hintText: widget.passHintText,
          hintStyle: widget.isNewPassFeild == true
              ? CustomTextStyle.kTextStyle14
              : CustomTextStyle.kTextStyle24
                  .copyWith(color: CustomColors.kBlack, wordSpacing: 12.3),
          contentPadding: EdgeInsets.zero.copyWith(left: 16.w, top: 10.h),
          suffixIcon: widget.isSuffixIcon == true
              ? IconButton(
                  onPressed: widget.suffixIconOnPressed,
                  icon: SvgPicture.asset(
                    widget.suffixIcon!,
                  ))
              : SizedBox(),
          enabledBorder: widget.underline,
          focusedBorder: widget.underline,
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
      );
    }
  }
}
