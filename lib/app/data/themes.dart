import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
    brightness: Brightness.light,
    primaryColor: CustomColors.kWhite,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: CustomColors.kWhite,
    drawerTheme: DrawerThemeData(
      backgroundColor: CustomColors.kWhite,
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.transparent),
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: CustomColors.kBlack,
    drawerTheme: DrawerThemeData(
      backgroundColor: CustomColors.kBlack,
    ),
    colorScheme: const ColorScheme.dark(),
  );
}
