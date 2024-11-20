import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/congratulations/congrats_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/transfer_by_wallet/transfer_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/transfer_by_wallet/transfer_screen.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CongratsScreen extends GetView<CongratsController> {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                   Gap(150),
              Assets.images.hands.image(),
              Gap(40),
              Text(
                'Congratulations!',
                style: FBText.fBTextOrangeBigMedium,
              ),
              Gap(6),
              Text(
                'Your Wallet is now activated.',
                style: FBText.fBTextBlackSmall,
              ),
              Gap(20),
              Text(
                "You’ve successfully completed your KYC by adding your BVN. Your wallet is now active, and you're ready to start funding it and making transactions with ease!",
                style: FBText.fBTextBlackBoldMedium,
              ),
                ],
              ),
            ),
           
           // Gap(100),
            SizedBox(
              //width: 340,
              height: 50,
              child: FBButton(
                title: 'Continue',
                textColor: FBColors.whiteColor,
                color: FBColors.orangeColor,
                onTap: () {
                  // Instantiate the ProfilePageController before navigating
                  Get.put(TransferController());
                  Get.to(() => TransferScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
