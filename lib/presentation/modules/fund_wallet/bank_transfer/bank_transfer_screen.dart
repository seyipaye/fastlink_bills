import 'package:fastlink_app/presentation/modules/fund_wallet/bank_transfer/bank_transfer_controller.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import 'pages/congrats_screen.dart';
import 'pages/identity_page.dart';

class BankTransferScreen extends GetView<BankTransferController> {
  const BankTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fund Wallet by Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView(
          controller: controller.pageController,
          children: [
            CompleteKYCPage(),
            IdentityProofPage(),
            CongratulationsPage()
          ],
        ),
      ),
    );
  }
}

class CompleteKYCPage extends GetView<BankTransferController> {
  const CompleteKYCPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complete your KYC',
                style: AppText.fBTextOrangeBig,
              ),
              gap20,
              Text(
                'To ensure a secure and seamless \nexperience, we are required by law to verify your identity before you can fund your wallet by transfer. ',
                style: AppText.fBTextBlackMedium,
              ),
            ],
          ),
        ),
        SizedBox(
          // width: 340,
          height: 50,
          child: FBButton(
            title: 'Proceed',
            textColor: FBColors.whiteColor,
            color: FBColors.orangeColor,
            onTap: controller.page1Submit,
          ),
        ),
        gap32,
      ],
    );
  }
}
