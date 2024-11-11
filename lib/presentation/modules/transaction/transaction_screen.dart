import 'package:fastlink_app/presentation/modules/home/home_page.dart';
import 'package:fastlink_app/presentation/modules/transaction/transaction_controller.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/presentation/widgets/transaction_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionScreen extends GetView<TransactionController> {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Transactions'),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          MonthandIcon(nameOfMonth: 'Sep'),
          verticalSpace(30),
            //TransactionsData()
            TransactionList(transactions: [],),
          ],
        ),
      ),
    ),
    );
  }
}




class MonthandIcon extends StatelessWidget {
  String nameOfMonth;
   MonthandIcon({
    required this.nameOfMonth,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(nameOfMonth,
        style: FBText.fBTextBlackBoldMedium,
        ),
        Icon(Icons.arrow_drop_down_sharp)
    ],);
  }
}