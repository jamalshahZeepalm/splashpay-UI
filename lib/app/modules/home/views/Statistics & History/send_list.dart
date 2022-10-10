import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/models/history.dart';

import 'package:splashpay/app/modules/home/views/Widgets/Custom_history.dart';

class SendListDataScreen extends StatefulWidget {
  const SendListDataScreen({Key? key}) : super(key: key);

  @override
  State<SendListDataScreen> createState() => _SendListDataScreenState();
}

class _SendListDataScreenState extends State<SendListDataScreen> {
  List<History> requestList = listOfHistory
      .where((element) => element.historyType == HistoryType.request)
      .toList();

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
                history: requestList[index],
                isAllList: false,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15.h,
              );
            },
            itemCount: requestList.length),
      ),
    );
  }
}
