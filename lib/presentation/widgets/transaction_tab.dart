import 'package:fastlink_app/presentation/modules/home/home_page.dart';
import 'package:fastlink_app/presentation/modules/transaction/transaction_controller.dart';
import 'package:fastlink_app/presentation/modules/transaction/transaction_screen.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionTab extends StatelessWidget {
  const TransactionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transactions',
              style: FBText.fBTextBlackBoldMedium,
            ),
            CustomTextButton(
              onTap: (){
                  // Instantiate the ProfilePageController before navigating
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
            )
          ],
        ),
        verticalSpace(30),
        TransactionsData(),
      ],
    );
  }
}