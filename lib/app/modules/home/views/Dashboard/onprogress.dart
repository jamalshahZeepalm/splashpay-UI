// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_transaction_card.dart';

import '../../../../models/transaction.dart';

class OnProgressScreen extends StatelessWidget {
  OnProgressScreen({Key? key}) : super(key: key);
  List<Transaction> onProgessList = listOfTransaction
      .where((element) => element.transactionType == TransactionType.onProgress)
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
              return CustomTransactionCard(
                transaction: onProgessList[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15.h,
              );
            },
            itemCount: onProgessList.length),
      ),
    );
  }
}
