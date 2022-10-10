import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 
import 'package:splashpay/app/modules/home/views/Widgets/custom_transaction_card.dart';

import '../../../../models/transaction.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  List<Transaction> incomeList = listOfTransaction
      .where((element) => element.transactionType == TransactionType.income)
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
                transaction: incomeList[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15.h,
              );
            },
            itemCount: incomeList.length),
      ),
    );
  }
}
