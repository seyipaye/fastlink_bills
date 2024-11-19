import 'package:fastlink_app/presentation/modules/wallet/card_payment/card_details/card_screen_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet/fund_wallet_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet/fund_wallet_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet_response/fund_wallet_controller.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class FundWalletResultScreen extends GetView<FundWalletResultController> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColors.whiteColor,
      // appBar: AppBar(
      //   title: Text('Add card details'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: Column(
          children: [
            verticalSpace(150),
            Assets.images.greenMark.image(),
                        Gap(40),
        
            Text('Your wallet has been funded\n successfully with NGN 5,000',
            style: FBText.fBTextBlackBoldMiddMedium,
            ),
                        Gap(250),
        
            SizedBox(
              //width: 320,
              height: 50,
              child: FBButton(title: 'Done',
              textColor: FBColors.whiteColor,
              color: FBColors.orangeColor,
              onTap: (){
                     //Instantiate the ProfilePageController before navigating
                Get.put(FundWalletController());
                  Get.to(() => FundWalletScreen());
              },
              ),
            )
          ],
        )),
      ),
    );
  }
}