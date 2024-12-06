import 'package:fastlink_app/presentation/modules/fund_wallet/transfer/bank_transfer_controller.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import 'pages/complete_kyc_page.dart';
import 'pages/congratulations_page.dart';
import 'pages/identity_proof_page.dart';

class BankTransferScreen extends GetView<BankTransferController> {
  const BankTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fund Wallet by Transfer'),
      ),
      body: SafeArea(
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
