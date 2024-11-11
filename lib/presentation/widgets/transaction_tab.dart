import 'package:fastlink_app/constants/constants.dart';
import 'package:fastlink_app/presentation/modules/home/home_page.dart';
import 'package:fastlink_app/presentation/modules/transaction/transaction_controller.dart';
import 'package:fastlink_app/presentation/modules/transaction/transaction_screen.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TransactionTab extends StatelessWidget {
  const TransactionTab({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {
        'title': 'Airtime Purchase',
        'date': 'Sep 5th, 18:25',
        'amount': '-200',
        'image': Assets.images.phone.image(width: 80, height: 40),
      },
      {
        'title': 'Data Purchase',
        'date': 'Sep 6th, 14:15',
        'amount': '-1000',
        'image': Assets.images.phone.image(width: 80, height: 40),
      },
     {
        'title': 'Fund Wallet',
        'date': 'Sep 3rd, 14:15',
        'amount': '+1200',
        'image': Assets.images.plus.image(width: 80, height: 40),
      },
    ];

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions',
                style: FBText.fBTextBlackBoldMedium,
              ),
              CustomTextButton(
                onTap: () {
                  Get.put(TransactionController());
                  Get.to(() => TransactionScreen());
                },
                text: 'View all',
                color: FBColors.orangeColor,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: FBColors.orangeColor,
                  size: 10,
                ),
              ),
            ],
          ),
          verticalSpace(30),
          TransactionList(transactions: transactions), 
        ],
      ),
    );
  }
}


//Information coming from the server.
class TransactionsData extends StatelessWidget {
  String title;
  String date;
  String amount;
  Widget image;
  TransactionsData(
      {required this.title,
      required this.date,
      required this.amount,
      required this.image,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1),
        
        border: Border.all(color: Color(0xFFC2C6C8), width: 0.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          image,
          //horizontalSpace(1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FBText.fBTextBlackBold12,
                ),
                verticalSpace(3),
                Text(
                  date,
                  style: FBText.fBTextBlacklittle,
                ),
              ],
            ),
          ),
          horizontalSpace(65),
          Text(
            amount,
            style: FBText.fBTextBlackBoldMidMedium16,
          ),
            horizontalSpace(10),
        ],
      ),
    );
  }
}


class TransactionList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const TransactionList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, 
      physics: NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: TransactionsData(
            title: transaction['title'],
            date: transaction['date'],
            amount: transaction['amount'],
            image: transaction['image'],
          ),
        );
      },
    );
  }
}
