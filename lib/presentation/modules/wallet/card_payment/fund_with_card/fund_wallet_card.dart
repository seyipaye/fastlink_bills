import 'package:fastlink_app/presentation/modules/wallet/card_payment/cards_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/cards_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/fund_with_card/fund_with_card_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet/fund_wallet_controller.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/widgets/app_text_form_field.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

//class FundWalletCardScreen extends GetView<FundWalletController> {}

class FundWithCardScreen extends GetView<FundWithCardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Fund Wallet with Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            AppTextFormField(
              //textEditingController: controller.emailText,
              label: 'Amount',
              //autofillHints: [AutofillHints.email],
              hintText: '#5,0000',
              //onSaved: (val) => controller.email = val!.trim(),
              //validator: Validator.isNotEmpty,
            ),
            verticalSpace(60),
            SizedBox(
              width: 340,
              height: 50,
              child: FBButton(
                title: 'Proceed',
                color: FBColors.orangeColor,
                textColor: FBColors.whiteColor,
                onTap: () {
                  // Instantiate the ProfilePageController before navigating
                  Get.put(CardsSelectionController());
                  Get.to(() => CardsScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
