import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashpay/app/models/transaction.dart';
import 'package:splashpay/app/modules/home/views/Widgets/custom_transaction_card.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  List<Transaction> expensesList = listOfTransaction
      .where((element) => element.transactionType == TransactionType.expenses)
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
                transaction: expensesList[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15.h,
              );
            },
            itemCount: expensesList.length),
      ),
    );
  }
}
