// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:splashpay/app/models/send_money.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../Widgets/custom_elevatedbutton.dart';

class SuccessfullyTransferedScreen extends StatefulWidget {
  final SendMoney sendMoney;
  double textAmount;
  SuccessfullyTransferedScreen({
    Key? key,
    required this.sendMoney,
    required this.textAmount,
  }) : super(key: key);

  @override
  State<SuccessfullyTransferedScreen> createState() =>
      _SuccessfullyTransferedScreenState();
}

class _SuccessfullyTransferedScreenState
    extends State<SuccessfullyTransferedScreen> {
  double totalAmount = 0;
  @override
  void initState() {
    totalAmount = widget.textAmount + 2.5;
    super.initState();
  }

  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SvgPicture.asset(
                CustomAssets.kTaskDone,
              ),
              Padding(
                padding: EdgeInsets.only(top: 27.h),
                child: Text(
                  'Successfully transfered',
                  style: CustomTextStyle.kTextStyle19,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.h),
                child: TicketWidget(
                  width: 352.w,
                  height: 394.h,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  color: CustomColors.kFillColor,
                  isCornerRounded: false,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 32.h, left: 127.w, right: 137.w),
                        child: Container(
                          width: 68.w,
                          height: 68.h,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            widget.sendMoney.profileImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Text(
                          widget.sendMoney.userName,
                          style: CustomTextStyle.kTextStyle19
                              .copyWith(fontSize: 16.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 4.h, left: 100.w, right: 100.w),
                        child: Text(
                          '7493 832 3829 732',
                          style: CustomTextStyle.kTextStyle12
                              .copyWith(fontSize: 12.sp),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 27.h, left: 39.w, right: 39.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount',
                              style: CustomTextStyle.kTextStyle12
                                  .copyWith(fontSize: 14.sp),
                            ),
                            Text(
                              '\$${widget.textAmount.toString()}',
                              style: CustomTextStyle.kTextStyle12.copyWith(
                                fontSize: 15.sp,
                                color: CustomColors.kBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 9.h, left: 39.w, right: 39.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fee',
                              style: CustomTextStyle.kTextStyle12
                                  .copyWith(fontSize: 14.sp),
                            ),
                            Text(
                              '\$2.5',
                              style: CustomTextStyle.kTextStyle12.copyWith(
                                fontSize: 15.sp,
                                color: CustomColors.kBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 12.h, left: 39.w, right: 39.w),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Colors.black,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 9.h, left: 39.w, right: 39.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Toatal',
                              style: CustomTextStyle.kTextStyle12
                                  .copyWith(fontSize: 14),
                            ),
                            Text(
                              '\$${totalAmount.toString()}',
                              style: CustomTextStyle.kTextStyle12.copyWith(
                                fontSize: 15,
                                color: CustomColors.kBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 12.h, left: 39.w, right: 39.w),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 34.h, left: 107.w, right: 107.w, bottom: 20.h),
                        child: SvgPicture.asset(CustomAssets.kBarcodesvg),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 39.h),
                child: CustomElevatedButton(
                    textColor: CustomColors.kWhite,
                    color: CustomColors.kBlack,
                    height: 38,
                    width: 331,
                    title: 'Download',
                    voidCallback: () async {
                      final image = await screenshotController.capture();
                      if (image == null) return;
                      await saveImage(image);
                      Get.snackbar(
                        'Screen Shot',
                        'your screenshot successfully save in a Gallery!',
                        snackPosition: SnackPosition.TOP,
                      );
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }

  saveImage(Uint8List image) async {
    final time =
        DateTime.now().toString().replaceAll('.', '_').replaceAll(':', '_');
    final imageName = 'screenShot_$time';
    final result = await ImageGallerySaver.saveImage(image, name: imageName);
    print(result);
  }
}
