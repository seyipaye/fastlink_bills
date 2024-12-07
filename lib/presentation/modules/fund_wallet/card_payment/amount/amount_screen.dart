import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/card_payment/amount/amount_controller.dart';
import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/widgets/app_buttons.dart';
import 'package:fastlink_app/presentation/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../resources/assets.gen.dart';
import '../../../../widgets/app_card.dart';

class AmmountScreen extends GetView<AmountController> {
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
              moneyInput: true,
              inputFormatters: <TextInputFormatter>[kMoneyFormatter],
              //autofillHints: [AutofillHints.email],
              hintText: '100 - 50,000',
              prefixIcon: kNairaIcon,
              //onSaved: (val) => controller.email = val!.trim(),
              //validator: Validator.isNotEmpty,
            ),
            Gap(60),
            SizedBox(
              //width: 340,
              height: 50,
              child: FBButton(
                title: 'Proceed',
                color: FBColors.orangeColor,
                textColor: FBColors.whiteColor,
                onTap: controller.onProceedPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardSelectionBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: AppIconButton2(
                width: 25,
                icon: Icon(Icons.close),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Gap(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saved cards',
                    ).applyStyle(bold: true),
                    gap4,
                    Text(
                      'List of all cards you saved',
                    ).applyStyle(fontSize: 12),
                  ],
                ),
              ],
            ),
            gap16,
            ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildItem(
                            title: 'Add a new Card',
                            onTap: () {},
                          ),
                          _buildItem(
                            title: 'Mastercard xxxx 9922',
                            text: 'Expires on 10/27',
                            onTap: () {},
                            onDeleteTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(36),
          ],
        ),
      ),
    );
  }

  AppMaterial _buildItem({
    String? text,
    required String title,
    required VoidCallback onTap,
    VoidCallback? onDeleteTap,
  }) {
    return AppMaterial(
      height: 56,
      onTap: () {},
      elevation: 0,
      radius: 10,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Assets.images.cardSvg.svg(),
          gap20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                ).applyStyle(bold: true),
                if (text != null)
                  Text(
                    text,
                  ).applyStyle(fontSize: 12)
              ],
            ),
          ),
          if (onDeleteTap != null)
            IconButton(
              onPressed: onDeleteTap,
              icon: Image.asset(
                'assets/icons/trash.png',
                height: 20,
              ),
            )
        ],
      ),
    );
  }
}
