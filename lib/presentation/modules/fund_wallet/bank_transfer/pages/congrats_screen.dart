import 'package:fastlink_app/presentation/modules/fund_wallet/bank_transfer/bank_transfer_controller.dart';
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
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Gap(150),
              Assets.images.hands.image(),
              Gap(40),
              Text(
                'Congratulations!',
                style: AppText.fBTextOrangeBig,
              ),
              Gap(6),
              Text(
                'Your Wallet is now activated.',
              ),
              Gap(20),
              Text(
                "You’ve successfully completed your KYC by adding your BVN. Your wallet is now active, and you're ready to start funding it and making transactions with ease!",
                style: AppText.fBTextBlackBoldMedium,
              ),
            ],
          ),
        ),

        // Gap(100),
        SizedBox(
          //width: 340,
          height: 50,
          child: FBButton(
            title: 'Go Back',
            textColor: FBColors.whiteColor,
            color: FBColors.orangeColor,
            onTap: controller.page3Submit,
          ),
        ),
        gap32,
      ],
    );
  }
}
