import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splashpay/app/data/colors.dart';
import 'package:splashpay/app/data/images_path.dart';
import 'package:splashpay/app/data/typography.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_graph.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_popmenu.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  List<String> items = [
    'Week',
    'Week 2',
    'Week 3',
    'Week 4',
    'Week 5',
  ];
  String dropdownvalue = 'Week';
  bool isCreditCard = false;
  int selectIndex = 0;
  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(child: Text(item));

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
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 20.w,
          ),
          Text(
            'Statistics',
            style: CustomTextStyle.kTextStyle19,
          ),
          MyPopUpMenu(
            isEditProfileScreen: false,
          )
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 21.h, left: 22.w, right: 20.w),
          child: Container(
            width: 350.w,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 350.w,
                height: 175.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        newMethod(
                          color: selectIndex == 0
                              ? CustomColors.kBlack
                              : CustomColors.kWhite,
                          myWidget: Center(
                            child: Text(
                              'Credit card',
                              style: CustomTextStyle.kTextStyle12.copyWith(
                                fontSize: 12.sp,
                                color: selectIndex == 0
                                    ? CustomColors.kWhite
                                    : CustomColors.kBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          voidCallback: () {
                            setState(() {
                              isCreditCard = !isCreditCard;
                              selectIndex = 0;
                            });
                          },
                        ),
                        newMethod(
                          color: selectIndex == 0
                              ? CustomColors.kFillColor
                              : CustomColors.kBlack,
                          myWidget: Center(
                            child: Text(
                              'Debit card',
                              style: CustomTextStyle.kTextStyle12.copyWith(
                                fontSize: 12.sp,
                                color: selectIndex == 0
                                    ? CustomColors.kBlack
                                    : CustomColors.kWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          voidCallback: () {
                            setState(() {
                              isCreditCard = !isCreditCard;
                              selectIndex = 1;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    isCreditCard
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 170.w,
                                height: 73.h,
                                color: CustomColors.kFillColor,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 3.h, left: 8.w),
                                      child: Container(
                                        width: 45.w,
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: CustomColors.kWhite,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            CustomAssets.kDownwalletIcon,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, left: 15.w),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Income',
                                            style: CustomTextStyle.kTextStyle12
                                                .copyWith(
                                              fontSize: 10.sp,
                                              color: CustomColors.kDarkBlue,
                                            ),
                                          ),
                                          Text(
                                            '\$1243',
                                            style: CustomTextStyle.kTextStyle14
                                                .copyWith(
                                              fontSize: 16.sp,
                                              color: CustomColors.kBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 170.w,
                                height: 73.h,
                                color: CustomColors.kFillColor,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 3.h, left: 8.w),
                                      child: Container(
                                        width: 45.w,
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: CustomColors.kWhite,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            CustomAssets.kUpwalletIcon,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, left: 15.w),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Expenses',
                                            style: CustomTextStyle.kTextStyle12
                                                .copyWith(
                                              fontSize: 10.sp,
                                              color: CustomColors.kSamiOrange,
                                            ),
                                          ),
                                          Text(
                                            '\$1243',
                                            style: CustomTextStyle.kTextStyle14
                                                .copyWith(
                                              fontSize: 16.sp,
                                              color: CustomColors.kBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 170.w,
                                height: 73.h,
                                color: CustomColors.kFillColor,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 3.h, left: 8.w),
                                      child: Container(
                                        width: 45.w,
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: CustomColors.kWhite,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            CustomAssets.kDownwalletIcon,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, left: 15.w),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Income',
                                            style: CustomTextStyle.kTextStyle12
                                                .copyWith(
                                              fontSize: 10.sp,
                                              color: CustomColors.kDarkBlue,
                                            ),
                                          ),
                                          Text(
                                            '\$1103',
                                            style: CustomTextStyle.kTextStyle14
                                                .copyWith(
                                              fontSize: 16.sp,
                                              color: CustomColors.kBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 170.w,
                                height: 73.h,
                                color: CustomColors.kFillColor,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 3.h, left: 8.w),
                                      child: Container(
                                        width: 45.w,
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: CustomColors.kWhite,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            CustomAssets.kUpwalletIcon,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 18.h, left: 15.w),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Expenses',
                                            style: CustomTextStyle.kTextStyle12
                                                .copyWith(
                                              fontSize: 10.sp,
                                              color: CustomColors.kSamiOrange,
                                            ),
                                          ),
                                          Text(
                                            '\$1473',
                                            style: CustomTextStyle.kTextStyle14
                                                .copyWith(
                                              fontSize: 16.sp,
                                              color: CustomColors.kBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              if (isCreditCard)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 37.h),
                      child: Container(
                        height: 45.h,
                        width: 331.w,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text('Total Balance',
                                    style:
                                        CustomTextStyle.kTextStyle12.copyWith(
                                      fontSize: 12.sp,
                                    )),
                                Text('\$2885.00',
                                    style:
                                        CustomTextStyle.kTextStyle12.copyWith(
                                      fontSize: 16.sp,
                                      color: CustomColors.kBlack,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 168.w),
                              child: Container(
                                width: 84.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomColors.kTinyLight)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    // Initial Value
                                    value: dropdownvalue,

                                    // Down Arrow Icon
                                    icon: Padding(
                                      padding: const EdgeInsets.all(3.0)
                                          .copyWith(bottom: 0.h, left: 0.w),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: CustomColors.kSamigrey,
                                        size: 24.sp,
                                      ),
                                    ),

                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0)
                                              .copyWith(right: 0.w),
                                          child: Text(
                                            items,
                                            style: CustomTextStyle.kTextStyle12
                                                .copyWith(
                                                    color:
                                                        CustomColors.kSamigrey),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: DottedBorder(
                        dashPattern: [4, 6],
                        padding: EdgeInsets.zero,
                        color: CustomColors.kBoderColor,
                        child: Container(
                          width: 331.w,
                          height: 310.h,
                          child: CustomGraphBar(index: 0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 23.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 7.r,
                                backgroundColor: CustomColors.kDarkBlue,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              Text(
                                'Income',
                                style: CustomTextStyle.kTextStyl12.copyWith(
                                  color: CustomColors.kDarkBlue,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 7.r,
                                backgroundColor: CustomColors.kSamiOrange,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              Text(
                                'Expenses',
                                style: CustomTextStyle.kTextStyl12.copyWith(
                                  color: CustomColors.kSamiOrange,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 37.h),
                      child: Container(
                        height: 45.h,
                        width: 331.w,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text('Total Balance',
                                    style:
                                        CustomTextStyle.kTextStyle12.copyWith(
                                      fontSize: 12.sp,
                                    )),
                                Text('\$2000.00',
                                    style:
                                        CustomTextStyle.kTextStyle12.copyWith(
                                      fontSize: 16.sp,
                                      color: CustomColors.kBlack,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 168.w),
                              child: Container(
                                width: 84.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomColors.kTinyLight)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    // Initial Value
                                    value: dropdownvalue,

                                    // Down Arrow Icon
                                    icon: Padding(
                                      padding: const EdgeInsets.all(3.0)
                                          .copyWith(bottom: 0.h, left: 0.w),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: CustomColors.kSamigrey,
                                        size: 24.sp,
                                      ),
                                    ),

                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0)
                                              .copyWith(right: 0.w),
                                          child: Text(
                                            items,
                                            style: CustomTextStyle.kTextStyle12
                                                .copyWith(
                                                    color:
                                                        CustomColors.kSamigrey),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: DottedBorder(
                        dashPattern: [4, 6],
                        padding: EdgeInsets.zero,
                        color: CustomColors.kBoderColor,
                        child: Container(
                          width: 331.w,
                          height: 310.h,
                          child: CustomGraphBar(index: 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 23.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 7.r,
                                backgroundColor: CustomColors.kDarkBlue,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              Text(
                                'Income',
                                style: CustomTextStyle.kTextStyl12.copyWith(
                                  color: CustomColors.kDarkBlue,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 7.r,
                                backgroundColor: CustomColors.kSamiOrange,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              Text(
                                'Expenses',
                                style: CustomTextStyle.kTextStyl12.copyWith(
                                  color: CustomColors.kSamiOrange,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget newMethod(
      {required Color color,
      required Widget myWidget,
      required VoidCallback voidCallback}) {
    return InkWell(
      onTap: voidCallback,
      child: Container(
        width: 170.w,
        height: 73.h,
        color: color,
        child: myWidget,
      ),
    );
  }
}
