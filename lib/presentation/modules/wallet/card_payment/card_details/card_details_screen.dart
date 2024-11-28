import 'package:fastlink_app/presentation/modules/wallet/card_payment/card_details/card_screen_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/amount/amount_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet_response/fund_wallet_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet_response/fund_wallet_result_screen.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/app_text_form_field.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CardDetailsScreen extends GetView<CardDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FBColors.whiteColor,
      appBar: AppBar(
        title: Text('Add card details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextFormField(
                //textEditingController: controller.emailText,
                label: 'Card Number',
                //autofillHints: [AutofillHints.email],
                hintText: '12343 3456 7689 7689',
                //onSaved: (val) => controller.email = val!.trim(),
                //validator: Validator.isNotEmpty,
              ),
              Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 140,
                    child: AppTextFormField(
                      //textEditingController: controller.emailText,
                      label: 'Expiry Date',
                      //autofillHints: [AutofillHints.email],
                      hintText: '08 / 76',
                      //onSaved: (val) => controller.email = val!.trim(),
                      //validator: Validator.isNotEmpty,
                    ),
                  ),
                  horizontalSpace(5),
                  SizedBox(
                    width: 140,
                    child: AppTextFormField(
                      //textEditingController: controller.emailText,
                      label: 'CVV',
                      //autofillHints: [AutofillHints.email],
                      hintText: '123',
                      //onSaved: (val) => controller.email = val!.trim(),
                      //validator: Validator.isNotEmpty,
                    ),
                  ),
                ],
              ),
              Gap(30),
              AppTextFormField(
                //textEditingController: controller.emailText,
                label: 'PIN',
                //autofillHints: [AutofillHints.email],
                hintText: '1234',
                //onSaved: (val) => controller.email = val!.trim(),
                //validator: Validator.isNotEmpty,
              ),
              Gap(30),
              Row(
                children: [
                  Text(
                    'Save card data for future payments',
                    style: FBText.fBTextBlackMedium,
                  ),
                ],
              ),
              Gap(50),
              SizedBox(
                width: 350,
                height: 50,
                child: FBButton(
                  title: 'Confirm',
                  textColor: FBColors.whiteColor,
                  color: FBColors.orangeColor,
                  onTap: () {
                    // Instantiate the ProfilePageController before navigating
                    Get.put(FundWalletResultController());
                    Get.to(() => FundWalletResultScreen());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
