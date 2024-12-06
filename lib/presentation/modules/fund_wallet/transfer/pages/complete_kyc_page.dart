import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/styles/color.dart';
import '../../../../utils/styles/fb_button.dart';
import '../../../../utils/styles/text_size.dart';
import '../bank_transfer_controller.dart';

class CompleteKYCPage extends GetView<BankTransferController> {
  const CompleteKYCPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Complete your KYC',
                  style: FBText.fBTextOrangeBig,
                ),
                gap20,
                Text(
                  'To ensure a secure and seamless \nexperience, we are required by law to verify your identity before you can fund your wallet by transfer. ',
                  style: FBText.fBTextBlackMedium,
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
        ],
      ),
    );
  }
}
