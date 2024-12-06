import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/transfer/bank_transfer_controller.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CongratulationsPage extends GetView<BankTransferController> {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Assets.images.hands.image(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Congratulations!',
                  style: FBText.fBTextOrangeBig,
                ),
                Gap(6),
                Text(
                  'Your Wallet is now activated.',
                ).applyStyle(fontWeight: FontWeight.w500),
                Gap(20),
                Text(
                  "You’ve successfully completed your KYC by adding your BVN. Your wallet is now active, and you're \nready to start funding it and making transactions with ease!",
                  style: FBText.fBTextBlackBoldMedium,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                //width: 340,
                height: 50,
                child: FBButton(
                  title: 'Go Back',
                  textColor: FBColors.whiteColor,
                  color: FBColors.orangeColor,
                  onTap: controller.page3Submit,
                ),
              ),
            ),
          ),
          gap32,
        ],
      ),
    );
  }
}
