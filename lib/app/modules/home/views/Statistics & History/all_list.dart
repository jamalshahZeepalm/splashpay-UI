import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/models/history.dart';

import '../Widgets/Custom_history.dart';

class AllListDataScreen extends StatefulWidget {
  const AllListDataScreen({Key? key}) : super(key: key);

  @override
  State<AllListDataScreen> createState() => _AllListDataScreenState();
}

class _AllListDataScreenState extends State<AllListDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 33.h, left: 22.w, right: 21.w),
        child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CustomHistoryList(
                history: listOfHistory[index],
                isAllList: true,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15.h,
              );
            },
            itemCount: listOfHistory.length),
      ),
    );
  }
}
