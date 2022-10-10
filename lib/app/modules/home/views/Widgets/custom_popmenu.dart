import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/colors.dart';
import '../../../../data/images_path.dart';

// ignore: must_be_immutable
class MyPopUpMenu extends StatelessWidget {
  final bool isEditProfileScreen;

  const MyPopUpMenu({super.key, required this.isEditProfileScreen});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) => [
              PopupMenuItem(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.settings,
                    color: CustomColors.kBlack,
                    size: 20.sp,
                  ),
                  Text('Option')
                ],
              ))
            ],
        child: isEditProfileScreen == false
            ? SvgPicture.asset(CustomAssets.kVerticalMenu)
            : SvgPicture.asset(
                CustomAssets.kVerticalMenu,
                color: CustomColors.kBlack,
              ));
  }
}
