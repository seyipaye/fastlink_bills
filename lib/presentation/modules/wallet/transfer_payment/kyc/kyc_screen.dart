import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/identity/identity_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/identity/identity_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/kyc/kyc_controller.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class KycScreen extends GetView<KycController> {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColors.whiteColor,
      appBar: AppBar(
        title: Text('Fund Wallet by Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(15),
            Text(
              'Complete your KYC',
              style: FBText.fBTextOrangeBig,
            ),
            verticalSpace(20),
            Flexible(
              child: Text(
                'To ensure a secure and seamless experience, we are required by law to verify your identity before you can fund your wallet by transfer. ',
                style: FBText.fBTextBlackMedium,
              ),
            ),
            Gap(400),
            SizedBox(
              // width: 340,
              height: 50,
              child: FBButton(
                title: 'Proceed',
                textColor: FBColors.whiteColor,
                color: FBColors.orangeColor,
                onTap: () {
                  // Instantiate the ProfilePageController before navigating
                  Get.put(IdentityController());
                  Get.to(() => IdentityScreen());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
