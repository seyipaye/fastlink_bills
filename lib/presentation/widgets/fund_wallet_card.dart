import 'package:fastlink_app/presentation/modules/wallet/fund_wallet/fund_wallet_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet/fund_wallet_screen.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:fastlink_app/presentation/utils/styles/fb_button.dart';
import 'package:fastlink_app/presentation/utils/styles/text_size.dart';
import 'package:fastlink_app/presentation/widgets/spacer.dart';
import 'package:fastlink_app/presentation/widgets/visible_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundWalletCard extends StatelessWidget {
  const FundWalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFFFFBFB),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wallet Balance',
                  style: FBText.fBTextBlackBoldMedium,
                ),
                verticalSpace(20),
                VisibilityToggleText(
                  text: '10000',
                  textStyle: FBText.fBTextBlackBoldMidMedium16,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 110,
            height: 28,
            child: FBButton(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              title: 'Fund wallet',
              leading: Icon(
                Icons.add,
                color: FBColors.whiteColor,
              ),
              color: FBColors.orangeColor,
              textColor: FBColors.whiteColor,
              onTap: () {
                //Instantiate the ProfilePageController before navigating
                Get.put(FundWalletController());
                Get.to(() => FundWalletScreen());
              },
            ),
          )
        ],
      ),
    );
  }
}
