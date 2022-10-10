import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/models/history.dart';

import '../Widgets/Custom_history.dart';

class RequestListDataScreen extends StatefulWidget {
  const RequestListDataScreen({Key? key}) : super(key: key);

  @override
  State<RequestListDataScreen> createState() => _RequestListDataScreenState();
}

class _RequestListDataScreenState extends State<RequestListDataScreen> {
  List<History> sendList = listOfHistory
      .where((element) => element.historyType == HistoryType.send)
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
                history: sendList[index],
                isAllList: false,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15.h,
              );
            },
            itemCount: sendList.length),
      ),
    );
  }
}
