import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/modules/home/views/Dashboard/scan_code.dart';

import '../../../../data/typography.dart';
import '../Widgets/custom_popmenu.dart';

class QuickpayScreen extends StatefulWidget {
  QuickpayScreen({Key? key}) : super(key: key);

  @override
  State<QuickpayScreen> createState() => _QuickpayScreenState();
}

class _QuickpayScreenState extends State<QuickpayScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width >= 240 ||
            MediaQuery.of(context).size.height >= 240)
        ? 400.0
        : 500.0;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240.w,
              height: 240.h,
              color: CustomColors.kFillColor,
              child: QRView(
                cameraFacing: CameraFacing.unknown,
                overlay: QrScannerOverlayShape(
                    borderColor: Colors.black,
                    borderRadius: 0.r,
                    borderLength: 60,
                    borderWidth: 6.w,
                    overlayColor: CustomColors.kWhite,
                    cutOutSize: scanArea),
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            SizedBox(
              height: 43.h,
            ),
            Text(
              'Scan your QR code here',
              style: CustomTextStyle.kTextStyle19.copyWith(
                fontWeight: FontWeight.w400,
                color: CustomColors.kBlack,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 115.h),
              child: InkWell(
                onTap: () {
                  Get.to(() => ScanCodeScreen());
                },
                child: Container(
                  width: 90.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.kBlack,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      CustomAssets.kCamera,
                      color: CustomColors.kWhite,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
