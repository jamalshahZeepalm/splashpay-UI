import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:splashpay/app/data/themes.dart';
import 'package:splashpay/app/modules/home/views/Onboarding/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(
    ScreenUtilInit(
      designSize: Size(395, 844),
      builder: (context, child) {
        return GetMaterialApp(
          theme: CustomTheme.lightTheme,
          title: "Splashpay",
          debugShowCheckedModeBanner: false,
          // initialRoute: AppPages.INITIAL,
          // getPages: AppPages.routes,
          home: SplashScreen(),
        );
      },
    ),
  );
}
